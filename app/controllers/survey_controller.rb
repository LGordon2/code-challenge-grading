class SurveyController < ApplicationController

  before_action :require_admin

	def index
		@survey = Survey.new
	end
	
	def create
		Survey.create(survey_params)
	end
	
	def result
	
	end
	private
	def survey_params
		params.require(:survey).permit(:haveParticipated,:whyStart, :newSkills, :howUsedSkills, :skillsExample, :whyNot, :whatWouldInterest, :whatWouldIncreaseParticipation, :bestLeague, :automation, :otherDevelopment, :betterServe)
	end
end
