class May < ActiveRecord::Migration
  def change
	Challenge.create(:month => "may", :year => "2014", :league => "bronze", :title => "Bizz Fizz Woof")
	Challenge.create(:month => "may", :year => "2014", :league => "silver", :title => "Candy Counter")
	Challenge.create(:month => "may", :year => "2014", :league => "gold", :title => "Path Finding")
  end
end
