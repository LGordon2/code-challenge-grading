class CreateChallengeWinners < ActiveRecord::Migration
  def change
    create_table :challenge_winners do |t|
      t.references :challenge
      t.references :submission
      t.timestamps
    end
  end
end
