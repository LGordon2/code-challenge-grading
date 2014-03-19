class AddIncreaseparticipationToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :whatWouldIncreaseParticipation, :string
  end
end
