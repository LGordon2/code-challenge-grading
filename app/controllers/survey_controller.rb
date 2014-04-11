class SurveyController < ApplicationController

  

	def index
		
		@survey = Survey.new
		
	end
	
	def create
		
		Survey.create(survey_params)
	end
	
	def result
		if params[:id]
		 @surveys = Survey.where(id: params[:id])
		else
		 @surveys = Survey.all
		end
		
		if params[:filter]
			@filter = params[:filter]
		end
	end
	
	def maze
		
		options = ["N", "S", "E", "W", "NE", "NS", "NW", "ES", "EW", "WS", "NES", "NWS", "EWS", "NEW", "NEWS"]
		maze = Hash.new(0)

		use_random = true

		maze_size = params[:size].to_i
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
		maze2 = maze
		startPoint=[rand(maze_size), rand(maze_size)]
		endPoint=[rand(maze_size), rand(maze_size)]
		maze2[endPoint] = "point"
		maze2[startPoint] = "point"
		newstring = " "
		 maze_size.times do |y|
		  maze_size.times do |x|
			newstring = newstring + maze2[[x,y]] + ","
		  end
		  newstring = newstring + ";"
		end
		
		@newstring = newstring.gsub(" ", "")
		
		paths= Hash.new(0)
		replace=""
		current_replace = 0
		path_counter = 1

		maze_size.times do |y|
		  maze_size.times do |x|
		   
			up = maze[[x, y-1]]
			down = maze[[x,y+1]]
			left = maze[[x-1,y]]
			right = maze[[x+1,y]]
			
			up_path = paths[[x, y-1]]
			down_path = paths[[x,y+1]]
			left_path = paths[[x-1,y]]
			right_path = paths[[x+1,y]]
			  
			  if left == 0 and up == 0
				
				paths[[x,y]] = path_counter
				path_counter = path_counter + 1
			  
			  elsif up == 0
				if left.include? "E"
				  paths[[x,y]] = left_path
				else
				  paths[[x,y]] = path_counter 
				  path_counter = path_counter + 1
				end 
			  elsif left == 0
				if up.include? "S"
				  paths[[x,y]] = up_path
				else
				  paths[[x,y]] = path_counter
				  path_counter = path_counter + 1
				end
			  else
				if up.include? "S" and left.include?"E"
				  if left_path.to_i > up_path.to_i
					paths[[x,y]] = up_path
					#replace = replace.to_s + left_path.to_s + "->"+ up_path.to_s + ","
					replace_value(paths, maze_size, left_path, up_path)
				  elsif up_path.to_i > left_path.to_i
					paths[[x,y]] = left_path
					#replace = replace.to_s + up_path.to_s + "->" + left_path.to_s + ","
					replace_value(paths, maze_size, up_path, left_path)
				  elsif up_path.to_i == left_path.to_i	
					paths[[x,y]] = left_path
				  end
				elsif up.include? "S"
					paths[[x,y]] = up_path
		
				elsif left.include? "E"
				  paths[[x,y]] = left_path
				else
				  paths[[x,y]] = path_counter
				  path_counter = path_counter + 1
				end  
			  end
			end
		end
=begin
		@oldReplace= replace
		newReplace = Array.new
		replace = replace.split(",")
		missingLink = Hash.new
		loop do 
			# some code here
			old = paths.to_a
            
			maze_size.times do |y|
				maze_size.times do |x|
					replace.reverse.each do |test|
						newValue = test.split("->")
						if newValue[0].to_i == paths[[x,y]].to_i
							if missingLink[newValue[0]]
								missingLink[newValue[0]].split(";").each do |link|
									if link.to_i > newValue[1].to_i
										newReplace.unshift(link.to_s + "->" + newValue[1].to_s) unless newReplace.include? link.to_s + "->" + newValue[1].to_s
									else
										newReplace.unshift(newValue[1].to_s + "->" + link.to_s) unless newReplace.include? newValue[1].to_s + "->" + link.to_s
									end
								end
								missingLink[newValue[0]] = missingLink[newValue[0]].to_s + ";" + newValue[1].to_s unless missingLink[newValue[0]].include? newValue[1].to_s
							else
								missingLink[newValue[0]] = newValue[1].to_s
							end
							missingLink[newValue[0]] =missingLink[newValue[0]].to_s + ";" + newValue[1].to_s 
							paths[[x,y]] = newValue[1]
						end
					end	  
				end
			end
			newReplace.each do |new|
				replace.unshift(new) unless replace.include? new
			end
			break if old.eql? paths.to_a
		end
=end
		pathString = " "
		 maze_size.times do |y|
		  maze_size.times do |x|
			pathString = pathString + paths[[x,y]].to_s + ","
		  end
		  pathString = pathString + ";"
		end
		
		@pathString = pathString.gsub(" ", "")
		if paths[startPoint].to_i == paths[endPoint].to_i
			@result = "A Path Does Exist"
			
		else
			@result = "A Path Does NOT Exist"
		end
    	@value1 = paths[startPoint].to_i
			@value2 = paths[endPoint].to_i
	end
	
	private
	def replace_value(hash, size, old, new)
		size.times do |y|
			size.times do |x|
				if hash[[x,y]].to_i == old.to_i
					hash[[x,y]] = new.to_i
				end  
			end
		end
	end

	def require_admin
		redirect_to :root unless current_user and current_user.admin
	end
	
	def survey_params
		params.require(:survey).permit(:haveParticipated,:whyStart, :newSkills, :howUsedSkills, :skillsExample, :whyNot, :whatWouldInterest, :whatWouldIncreaseParticipation, :bestLeague, :automation, :otherDevelopment, :betterServe)
	end
end
