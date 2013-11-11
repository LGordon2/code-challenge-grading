class SessionsController < ApplicationController
  def create
    if user = User.authenticate(params[:username], params[:password])
      session[:user_id] = user.id
      session[:change] = true
      redirect_to root_url, :notice => "Logged In"
    else
      redirect_to :login, :alert => "Invalid username or password."
    end
  end

  def destroy
    session[:user_id] = nil
    session[:change] = true
    redirect_to root_url, :notice =>  "Logged Out"
  end
  
  private
  
  def user_params
    params.permit(:username, :password)
  end
end
