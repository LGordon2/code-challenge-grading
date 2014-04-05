class WelcomeController < ApplicationController
  before_action :require_login, only: :index
  def validate_login
    #Get their picture.
    user = User.find_or_create(params[:user][:username])
    unless user.validate_against_ad(params[:user][:password])
      redirect_to :login, flash: {error: "Invalid username or password."}
      return
    end
	
    if user.save
      user.touch
      session[:user_id] = user.id
    else
      flash[:error] = user.errors.full_messages.first
    end
    redirect_to :root
  end

  def logout
    session[:user_id] = nil
    redirect_to :login, :error =>  "Logged Out"
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
  
  def rules
  
  end
end
