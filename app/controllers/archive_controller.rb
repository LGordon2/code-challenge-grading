class ArchiveController < ApplicationController
  def show
     @league = params[:league]
  end
end
