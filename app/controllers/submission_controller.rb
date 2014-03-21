class SubmissionController < ApplicationController
  def destroy
  end
  
  def update
    submission = Submission.find(params[:id])
    submission.update(complete: params['submission']['complete'].to_s=="1")
    submission.save
  end
  
end
