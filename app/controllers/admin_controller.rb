class AdminController < ApplicationController
  def index
    redirect_to :root unless current_user and current_user.admin
  end
end
