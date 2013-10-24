class ProfileController < ApplicationController
  def destroy
    Submission.find(current_user.id).destroy
    redirect_to :back
  end
end