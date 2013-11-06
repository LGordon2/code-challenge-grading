class FixPhotoUsers < ActiveRecord::Migration
  def change
    change_column :users, :photo, :string
    remove_column :users, :photo_file
  end
end
