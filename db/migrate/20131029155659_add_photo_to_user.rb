class AddPhotoToUser < ActiveRecord::Migration
  def change
    add_column :users, :photo, :text
  end
end
