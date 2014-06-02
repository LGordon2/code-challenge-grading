class SubmissionController < ApplicationController
  before_action :set_submission, only: [:show, :update]
  before_action :require_user_or_admin, only: [:show, :update]
  
  def destroy
  end
  
  def show
  end
  
  def update
    @submission.update(complete: params['submission']['complete'].to_s=="1")
    @submission.save
  end
  def winner
  	submission = Submission.find(params[:winner][:submission_id])
  	#winner = submission.challenge.challenge_winners.find_by(challenge_id: submission.challenge.id,submission_id: submission.id)
  	if params[:winner][:isWinner].to_s == "1"
  		submission.challenge.challenge_winners.create(challenge_id: submission.challenge.id,submission_id: submission.id)
  	else
  		submission.challenge.challenge_winners.find_by(challenge_id: submission.challenge.id,submission_id: submission.id).destroy
  	end
  end
  
  private
  
  def is_winner?
    
  end
  
  def set_submission
    @submission = Submission.find(params[:id])
  end
  
  def require_user_or_admin
    redirect_to :root unless current_user.admin? or current_user == @submission.user or @submission.is_winner?
  end
end
