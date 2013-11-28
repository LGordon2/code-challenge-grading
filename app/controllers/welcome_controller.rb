class WelcomeController < ApplicationController
  before_action :require_login, only: :index
  before_action :user_params, only: :validate_login
  
  def validate_login
   
    @ldap = get_ldap(params[:user][:username],params[:user][:password])
    invalid_ldap_auth_check = !params[:user][:password].blank? or (Rails.env.production? and @ldap.bind)
    unless invalid_ldap_auth_check
      redirect_to :login, flash: {error: "Invalid username or password."}
      return
    end
    
    #Get their picture.
    user = User.find_or_create(params[:user][:username])
    user.retrieve_picture(@ldap) unless invalid_ldap_auth_check 
    if user.save!
      user.touch
      session[:user_id] = user.id
    else
      flash[:error] = user.errors
    end
    redirect_to :root
  end
  
  def logout
    session[:user_id] = nil
    redirect_to :login, :error =>  "Logged Out"
  end
  
  private 
  
  def get_ldap(username, password)
    #Do authentication against the AD.
    ldap = Net::LDAP.new :host => '10.238.242.32',
    :port => 389,
    :auth => {
      :method => :simple,
      :username => "ORASI\\#{username}",
      :password => password
    }
  end
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
  
end
