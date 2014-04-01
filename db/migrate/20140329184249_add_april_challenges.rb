class AddAprilChallenges < ActiveRecord::Migration
  def change
	Challenge.create(:month => "april", :year => "2014", :league => "bronze", :title => "N - Ultimate")
	Challenge.create(:month => "april", :year => "2014", :league => "silver", :title => "Disemvoweler")
	Challenge.create(:month => "april", :year => "2014", :league => "gold", :title => "Hello Obfuscation")
  end
end
