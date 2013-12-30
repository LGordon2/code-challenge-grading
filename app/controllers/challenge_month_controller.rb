class ChallengeMonthController < ApplicationController
  before_action :require_login
  before_action :set_comment_reply
  
  #To get the challenge_month and challenge_league.
  helper_method :challenge_month, :challenge_league, :submission
  
  def bronze
    @challenge_league_type = "bronze"
    challenge_month_layout
  end
  
  def silver
    @challenge_league_type = "silver"
    challenge_month_layout
  end
  
  def gold
    @challenge_league_type = "gold"
    challenge_month_layout
  end
  
  def challenge_month_layout
    @comment_reply = Comment.new
    @challenge_title = Challenge.find_by(month: challenge_month, league: @challenge_league_type, year: 2013).title
    render template: "layouts/monthly_challenge"
  end
  
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

  def all_submissions
    render template: 'layouts/all_submissions'
  end
  
  def set_comment_reply
    @comment_reply = Comment.new if @comment_reply.blank?
  end
end
