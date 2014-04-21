class ChallengeController < ApplicationController
  before_action :require_login
  before_action :set_comment_reply
  
  #To get the challenge_month and challenge_league.
  helper_method :challenge_month, :challenge_league, :challenge_year, :submission
  
  def index
    @comment_reply = Comment.new
    @challenge_title = Challenge.find_by(month: challenge_month.downcase, league: challenge_league.downcase, year: challenge_year).title
    begin
      render template: "#{challenge_month}/#{challenge_year}/#{challenge_league}"
    rescue
      render template: "layouts/monthly_challenge"
    end
  end
  
  def result
    if params[:ExistingCode].blank?
		@submission = Submission.new
	    @submission.user_id = session[:user_id]
		@submission.submission_code = params[:script].read
		@submission.challenge = Challenge.find_by(month: challenge_month, league: challenge_league, year: challenge_year)
		@submission.month = challenge_month
		@submission.league = challenge_league
		@submission.year = challenge_year
		@submission.visible = "t"
		@submission.save
    
    else
		@submission = Submission.find(params[:ExistingCode])
    end

   
    if challenge_month.downcase == "november" and challenge_league.downcase == "bronze" and challenge_year == "2013"
      render template: 'fibonacci/index'
    elsif challenge_month.downcase == "november" and challenge_league.downcase == "silver" and challenge_year == "2013"
      render template: 'cheeseburger/index'
    elsif challenge_month.downcase == "november" and challenge_league.downcase == "gold" and challenge_year == "2013"
      render template: "connect_four/index"
	  elsif challenge_month.downcase == "may" and challenge_league.downcase == "gold" and challenge_year == "2014"
      redirect_to "/maze/index/#{@submission.id}"
    else
      render template: 'layouts/result'
    end
  end
  
  def submission
    return @submission
  end
  
  def challenge_league
    params[:league]
  end
  
  def challenge_month
    params[:month]
  end
  
  def challenge_year
    params[:year]
  end

  def all_submissions
    unless current_user.admin?
      redirect_to :root
      return
    end
    respond_to do |format|
      format.html {render template: 'layouts/all_submissions'}
    end
  end
  
  def set_comment_reply
    @comment_reply = Comment.new if @comment_reply.blank?
  end
  
  private
  
  def submission_params
    params.permit(:month,:year,:league)
  end
end
