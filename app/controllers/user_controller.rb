class UserController < ApplicationController
  before_action :require_login
  skip_before_action :verify_authenticity_token
  
  def update
    user = User.find(params[:id])
    user.update(admin: !user.admin?)
    user.save
  end
end
