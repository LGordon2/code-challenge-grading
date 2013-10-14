class OctoberController < ChallengeMonthController
  before_action :require_login
  def bronze
  end

  def silver
  end

  def gold
  end
  
  def result
    submission = Submission.new
    submission.user_id = session[:user_id]
    submission.submission_code = params[:script].read
    submission.save
  end
end
