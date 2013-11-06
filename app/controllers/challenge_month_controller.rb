class ChallengeMonthController < ApplicationController
  
  #To get the challenge_month and challenge_league.
  helper_method :challenge_month, :challenge_league, :submission
  
  def result
    @submission = Submission.new
    if params[:ProxySubmission].blank?
	    @submission.user_id = session[:user_id]
    else
	    @ProxyUser = User.find_by_username(params[:ProxySubmission].downcase)
    	    @submission.user_id = @ProxyUser.id
    end

    @submission.submission_code = params[:script].read
    @submission.month = challenge_month
    @submission.league = challenge_league
    @submission.save
    	
    render template:'layouts/result'
  end
  
  def submission
    return @submission
  end
  
  def challenge_league
    request.env['HTTP_REFERER'].match(controller_name+'/(\w+)')[1]
  end
  
  def challenge_month
    controller_name
  end
  
  def submission_json
    #render json: Submission.where(month: challenge_month, league: challenge_league).group(:user_id).having('max(created_at)').to_a
  end
end
