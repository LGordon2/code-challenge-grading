class AddPhotoFile < ActiveRecord::Migration
  def change
    add_column :users, :photo_file, :string
  end
end
