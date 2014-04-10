class SurveyController < ApplicationController

  

	def index
		
		@survey = Survey.new
		
	end
	
	def create
		
		Survey.create(survey_params)
	end
	def result
	
	end
	def maze
		if params[:id]
		 @surveys = Survey.where(id: params[:id])
		else
		 @surveys = Survey.all
		end
		
		if params[:filter]
			@filter = params[:filter]
		end
		options = ["N", "S", "E", "W", "NE", "NS", "NW", "ES", "EW", "WS", "NES", "NWS", "EWS", "NEW", "NEWS"]
	maze = Hash.new(0)

	use_random = true

	maze_size = 19
	maze_size.times do |i| 
	  maze_size.times do |j|
		if use_random
		  maze[[i,j]] = options[rand(options.count)]
		  use_random = false
		else
		  maze[[i,j]] = 1
		  use_random = true
		end
	  end
	end

	maze_size.times do |y|
	  maze_size.times do |x|
		if maze[[x,y]] == 1
		  up = maze[[x, y-1]]
		  down = maze[[x,y+1]]
		  left = maze[[x-1,y]]
		  right = maze[[x+1,y]]
		  current_cell = maze[[x,y]]
		
		  if up != 0
			if up.include? "S"
			  maze[[x,y]] = maze[[x,y]]== 1? "N":maze[[x,y]] + "N"    
			end
		  end
		
		  if right != 0
			if right.include? "W"
			  maze[[x,y]] = maze[[x,y]]== 1? "E":maze[[x,y]] + "E"    
			end
		  end
		
		  if down != 0
			if down.include? "N"
			  maze[[x,y]] = maze[[x,y]]== 1? "S":maze[[x,y]] + "S"    
			end
		  end
		
		  if left != 0
			if left.include? "E"
			  maze[[x,y]] = maze[[x,y]]== 1? "W":maze[[x,y]] + "W"    
			end
		  end
		  
		  if maze[[x,y]] == 1
			maze[[x,y]] = "blank"
		  end
	   end    
	  end
	end
	
	newstring = " "
	 maze_size.times do |y|
	  maze_size.times do |x|
		newstring = newstring + maze[[x,y]] + ","
	  end
	  newstring = newstring + ";"
	end
	
	@newstring = newstring.gsub(" ", "")
	end
	
	private

	def require_admin
		redirect_to :root unless current_user and current_user.admin
	end
	
	def survey_params
		params.require(:survey).permit(:haveParticipated,:whyStart, :newSkills, :howUsedSkills, :skillsExample, :whyNot, :whatWouldInterest, :whatWouldIncreaseParticipation, :bestLeague, :automation, :otherDevelopment, :betterServe)
	end
end
