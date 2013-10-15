class OctoberController < ChallengeMonthController
  before_action :require_login
  def bronze
  end

  def silver
  end

  def gold
  end
  
  def result
    @submission = Submission.new
    @submission.user_id = session[:user_id]
    @submission.submission_code = params[:script].read
    @submission.month = controller_name
    @submission.league = request.env['HTTP_REFERER'].match(controller_name+'/(\w+)/?')[1]
    @submission.save
  end
end
