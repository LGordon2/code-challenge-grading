class AdminController < ApplicationController
  before_action :validate_user_is_admin 
  
  def update
    user = User.find(params[:id])
    user.password = params[:user][:password]
    user.password_confirmation = params[:user][:password_confirmation]
    if(user.save)
      redirect_to :admin
    else
      flash[:errors] = user.errors
      redirect_to :back 
    end
  end
  
  private 
  
    def validate_user_is_admin
      redirect_to root_path, notice: "Insufficient privileges" unless current_user.admin  
    end
end
