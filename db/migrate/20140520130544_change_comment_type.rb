class ChangeCommentType < ActiveRecord::Migration
  def up
    change_column :comments, :comment, :text, :limit => nil
  end
  
  def down
    change_column :comments, :comment, :string
  end
end
