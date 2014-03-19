class SurveyController < ApplicationController
	def index
		@survey = Survey.new
	end
	
	def create
		Survey.create(survey_params)
	end
	
	private
	def survey_params
		params.require(:survey).permit(:haveParticipated,:whyStart, :newSkills, :howUsedSkills, :skillsExample, :whyNot, :whatWouldInterest, :whatWouldIncreaseParticipation, :bestLeague, :automation, :otherDevelopment, :betterServe)
	end
end
