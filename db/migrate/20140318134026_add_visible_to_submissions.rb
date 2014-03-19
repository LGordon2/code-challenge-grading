class AddVisibleToSubmissions < ActiveRecord::Migration
  
    def change

    	add_column :submissions, :visible, :string
  
	Submission.all.each do |s|
	     s.update_attribute("visible", "t")
	end
    end

end
