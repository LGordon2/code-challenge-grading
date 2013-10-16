class ChallengeMonthController < ApplicationController
  
  #To get the challenge_month and challenge_league.
  helper_method :challenge_month, :challenge_league, :submission
  
  def result
    @submission = Submission.new
    @submission.user_id = session[:user_id]
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
end
