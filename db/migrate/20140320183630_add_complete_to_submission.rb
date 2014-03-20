class AddCompleteToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :complete, :boolean
  end
end
