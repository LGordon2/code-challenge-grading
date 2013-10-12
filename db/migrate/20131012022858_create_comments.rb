class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :comment
      t.string :month
      t.string :league

      t.timestamps
    end
  end
end
