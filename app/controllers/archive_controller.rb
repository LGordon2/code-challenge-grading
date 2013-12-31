class ArchiveController < ApplicationController
  before_action :require_login
  
  def show
     @league = params[:league]
  end
end
