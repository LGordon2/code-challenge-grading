class ChallengeIdReferenceMigration < ActiveRecord::Migration
  def change
    Submission.all.each do |submission|
      challenge = Challenge.find_by(month: submission.month, league: submission.league, year: submission.year)
      unless challenge.blank?
        submission.update(challenge_id: challenge.id)
      end
    end
  end
end
