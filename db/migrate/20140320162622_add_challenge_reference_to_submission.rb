class AddChallengeReferenceToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :challenge_id, :integer
  end
end
