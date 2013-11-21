class AdminController < ApplicationController
  def index
    redirect_to :root unless current_user and current_user.admin
  end

  def add_admin
	user = User.find(params[:id])
	user.update_attribute(:admin, user.admin ? '':'true')
	
	redirect_to "/admin"
  end
end
