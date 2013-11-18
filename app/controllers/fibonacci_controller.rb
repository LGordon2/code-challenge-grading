class FibonacciController < ApplicationController
  def index
    @submission = Submission.new
    if params[:ProxySubmission].blank?
      @submission.user_id = session[:user_id]
    else
      @ProxyUser = User.find_by_username(params[:ProxySubmission].downcase)
      @submission.user_id = @ProxyUser.id
    end
    
    @submission.submission_code = params[:script].read
    @submission.month = "november"
    @submission.league = "bronze"
    @submission.save
  end
end
