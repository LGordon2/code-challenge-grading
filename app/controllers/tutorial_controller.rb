class TutorialController < ApplicationController
	def index
		tutorial = Hash.new
		tutorial[:title]="Add Two Numbers"
		tutorial[:desc]= "In this challenge you will use a function to add two numbers.  The numbers will be input parameters for the function and you will output the result"
		tutorial[:code]= "{nl}Function MattWatson(num1, num2){nl}{nl}{nl}{nl}	{Your solution goes here}{nl}{nl}{nl}{nl}End Function"
		tutorial[:tip1] = " Assign the result to the function name"
		tutorial[:tip2] = " Use the syntax FunctionName = result  to return value"
		tutorial[:tip3] = " Learn to code"
		@tutorial = tutorial

	end


end
