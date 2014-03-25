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
	
	private

	def require_admin
		redirect_to :root unless current_user and current_user.admin
	end
	
	def survey_params
		params.require(:survey).permit(:haveParticipated,:whyStart, :newSkills, :howUsedSkills, :skillsExample, :whyNot, :whatWouldInterest, :whatWouldIncreaseParticipation, :bestLeague, :automation, :otherDevelopment, :betterServe)
	end
end
