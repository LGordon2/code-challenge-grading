class AddIncreaseinterestToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :whatWouldInterest, :string
  end
end
