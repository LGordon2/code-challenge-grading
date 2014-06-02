class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge
  
  def is_winner?
    !ChallengeWinner.find_by(submission_id: self.id).blank?
  end
end
