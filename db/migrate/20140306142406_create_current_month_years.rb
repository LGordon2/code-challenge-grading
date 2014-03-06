class CreateCurrentMonthYears < ActiveRecord::Migration
  def change
    create_table :current_month_years do |t|
      t.string :month
      t.integer :year

      t.timestamps
    end
    
    CurrentMonthYear.create({month: "january", year: 2014})
  end
end
