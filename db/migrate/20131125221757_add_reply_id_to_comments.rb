class AddReplyIdToComments < ActiveRecord::Migration
  def change
    change_table(:comments) do |t|
      t.integer :reply_id
    end
  end
end
