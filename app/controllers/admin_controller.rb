class AdminController < ApplicationController
  def update
    user = User.find(params[:id])
    user.password = params[:user][:password]
    user.password_confirmation = params[:user][:password_confirmation]
    if(user.save)
      render action: 'index'
    else
      flash[:errors] = user.errors
      redirect_to :back 
    end
  end
end
