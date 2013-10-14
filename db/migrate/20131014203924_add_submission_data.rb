class AddSubmissionData < ActiveRecord::Migration
  def change
    add_column :submissions, :submission_code, :text
  end
end
