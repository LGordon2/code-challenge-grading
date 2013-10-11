class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      session[:change] = true
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
