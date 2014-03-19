class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :haveParticipated
      t.string :whyStart
      t.string :newSkills
      t.string :howUsedSkills
      t.string :betterServe
      t.string :whyNot
      t.string :bestLeague
      t.string :automation
      t.string :otherDevelopment

      t.timestamps
    end
  end
end
