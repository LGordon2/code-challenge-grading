class SessionsController < ApplicationController
  def create
    user = User.authenticate(params[:username].downcase, params[:password])
    if user
      session[:user_id] = user.id
      session[:change] = true
      session[:f_name],session[:l_name] = user.username.split('@').first.split('.')
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
