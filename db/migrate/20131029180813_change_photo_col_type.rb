class ChangePhotoColType < ActiveRecord::Migration
  def change
    change_column :users, :photo, :blob
  end
end
