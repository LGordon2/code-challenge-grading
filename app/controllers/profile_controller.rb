class ProfileController < ApplicationController
  def destroy
    Submission.find(params[:id]).destroy
    redirect_to :back
  end
end