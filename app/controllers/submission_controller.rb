class SubmissionController < ApplicationController
  def destroy
  end
  def show
	@submission = Submission.find(params[:id])
  end
  def update
    submission = Submission.find(params[:id])
    submission.update(complete: params['submission']['complete'].to_s=="1")
    submission.save
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
end
