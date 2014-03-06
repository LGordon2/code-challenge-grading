class AddMarchChallenges < ActiveRecord::Migration
  def change
    Challenge.create({month: "march", league: "bronze", year: 2014, title: "Bingo Number Generator"})
    Challenge.create({month: "march", league: "silver", year: 2014, title: "Bingo Player"})
    Challenge.create({month: "march", league: "gold", year: 2014, title: "Vowel Mayhem"})
  end
end
