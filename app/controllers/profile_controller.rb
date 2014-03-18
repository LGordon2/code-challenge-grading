class ProfileController < ApplicationController
  def destroy
    Submission.find(params[:id]).update_attribute("visible", "f")
    redirect_to :back
  end
end