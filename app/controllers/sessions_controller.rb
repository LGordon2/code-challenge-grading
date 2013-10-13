class SessionsController < ApplicationController
  skip_before_action :require_login
  def new
  end

  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      session[:change] = true
      dotLocation =user.username.index(".")
      session[:f_name] = user.username[0,dotLocation]
      session[:l_name] = user.username[dotLocation+1,user.username.length-session[:f_name].length-11]
      redirect_to root_url, :notice => "Logged In"
    else
      redirect_to root_url, :alert => "Invalid username or password."
    end
  end

  def destroy
    session[:user_id] = nil
    session[:change] = true
    redirect_to root_url, :notice =>  "Logged Out"
  end
end
