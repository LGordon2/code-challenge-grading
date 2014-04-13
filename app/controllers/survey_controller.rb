class Matrix
  public :"[]=", :set_element, :set_component
end
class SurveyController < ApplicationController

    before_action :require_admin

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
		require 'matrix'
		x_size = 25
		y_size = 25
		startPoint = [rand(y_size), rand(x_size)]
		endPoint = [rand(y_size), rand(x_size)]
		
		direction_options = ["N", "S", "E", "W", "NE", "NS", "NW", "ES", "EW", "WS", "NES", "NWS", "EWS", "NEW", "NEWS"]
		init_maze = Matrix.build(y_size,x_size) {|row, col| (row %2)==(col%2)? direction_options[rand(direction_options.count)]:0}
		maze = Matrix.build(y_size,x_size){|row, col| (row %2)==(col%2)? init_maze[row,col]: complete_maze_from_neighbors(row,col, init_maze)}
		display_maze = maze.clone
		display_maze[startPoint[0], startPoint[1]] = "points"
		display_maze[endPoint[0], endPoint[1]] = "point"
		@start = maze[startPoint[0], startPoint[1]]
		@end = maze[endPoint[0], endPoint[1]]
		@maze_string = getString(display_maze)
		
		counter = 1
		
		paths = Matrix.build(y_size, x_size) {|row, col| 0}
		paths.to_a.count.times do |row|
			paths.to_a[0].count.times do |col|
				if row == 0 and col == 0
					#Top Left Corner
					paths[row,col] = counter
					counter += 1
				elsif row == 0
					#Top Row
					if maze[row,col-1].include? "E"
						paths[row,col] = paths[row,col-1]
					else
						paths[row,col] = counter
						counter += 1
					end
				elsif col == 0
					#Left Column
					if maze[row-1,col].include? "S"
						paths[row,col] = paths[row-1,col]
					else
						paths[row,col] = counter
						counter += 1
					end
				else
					#Anywhere else
					if maze[row,col-1].include? "E" and maze[row-1,col].include? "S"
						#left									#up
							paths[row,col] = paths[row-1,col] >= paths[row,col-1] ? paths[row,col-1] : paths[row-1,col] 
												#up						#left			#left				#up
							paths = replace_in_matrix(paths,paths[row,col-1],paths[row-1,col]) 
																	#left		#up
					elsif maze[row,col-1].include? "E"
						paths[row,col] = paths[row,col-1]
					elsif maze[row-1,col].include? "S"
						paths[row,col] = paths[row-1,col]
					else
						paths[row,col] = counter
						counter += 1
					end
				end
			end	
			
		end
		
		@path_string = getString(paths)
		@result = paths[startPoint[0], startPoint[1]] == paths[endPoint[0], endPoint[1]] 
	end

	def require_admin
		redirect_to :root unless current_user and current_user.admin
	end
	
	def survey_params
		params.require(:survey).permit(:haveParticipated,:whyStart, :newSkills, :howUsedSkills, :skillsExample, :whyNot, :whatWouldInterest, :whatWouldIncreaseParticipation, :bestLeague, :automation, :otherDevelopment, :betterServe)
	end
	
	#Private
	
	def replace_in_matrix( matrix, val1, val2)
		if val1 > val2
			matrix.collect{ |m| m == val1 ? val2 : m}
		else
			matrix.collect{ |m| m == val2 ? val1 : m}
		end
	end
	
	def getString(matrix)
		output_string = ""
		matrix.row_vectors.each do |r|
		  output_string = output_string + r.to_a.join(",") + ";"
		end
		output_string
	end
	
	def complete_maze_from_neighbors(row,col, maze)
		
		result = ""
		
		if row != 0 and maze[row-1,col] and maze[row-1,col].include? "S"
			result = result + "N"
		end
		
		if col != (maze.to_a[0].count) and maze[row,col+1] and maze[row,col+1].include? "W"
			result = result + "E"
		end
		
		if row != (maze.to_a.count) and maze[row+1,col] and maze[row+1,col].include? "N"
			result = result + "S"
		end
		
		if col != 0 and maze[row,col-1] and maze[row,col-1].include? "E"
			result = result + "W"
		end
		
		if result == ""
			result = "blank"
		end
		
		result
	end
		
end
