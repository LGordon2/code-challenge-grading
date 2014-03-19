class AddSkillexampleToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :skillsExample, :string
  end
end
