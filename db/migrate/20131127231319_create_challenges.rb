class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :month
      t.string :league
      t.integer :year
      t.string :title
      t.string :winner
    end
  end
end
