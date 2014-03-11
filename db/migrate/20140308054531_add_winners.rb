class AddWinners < ActiveRecord::Migration
  def change
	Challenge.where(:month => "january", :league => "bronze").first.update_attribute(:winner, "Erin Dodd, Eric Trout")
	Challenge.where(:month => "january", :league => "silver").first.update_attribute(:winner, "Michael Simpkins")
	Challenge.where(:month => "january", :league => "gold").first.update_attribute(:winner, "Jessica Marshall")
	
	Challenge.where(:month => "february", :league => "bronze").first.update_attribute(:winner, "Sarath Medisetty")
	Challenge.where(:month => "february", :league => "silver").first.update_attribute(:winner, "Alissa Taylor")
	Challenge.where(:month => "february", :league => "gold").first.update_attribute(:winner, "Y Hung Mlo")
  end
end
