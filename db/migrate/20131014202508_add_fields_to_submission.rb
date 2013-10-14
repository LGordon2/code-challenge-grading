class AddFieldsToSubmission < ActiveRecord::Migration
  def change
    change_table :submissions do |t|
      t.references :user
    end
  end
end
