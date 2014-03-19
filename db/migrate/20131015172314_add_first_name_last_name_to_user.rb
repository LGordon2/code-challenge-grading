class AddFirstNameLastNameToUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password

      t.timestamps
    end
    create_table :comments do |t|
      t.string :name
      t.string :comment
      t.string :month
      t.string :league

      t.timestamps
    end
    create_table :submissions do |t|

      t.timestamps
    end
    change_table :submissions do |t|
      t.references :user
    end
    add_column :submissions, :submission_code, :text
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
