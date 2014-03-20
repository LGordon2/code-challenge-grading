class AddSuToUser < ActiveRecord::Migration
  def change
    add_column :users, :su, :string
  end
end
