class FibonacciController < ApplicationController
  before_action :require_login
  
  def index
    @submission = Submission.new
    if params[:ProxySubmission].blank?
      @submission.user_id = session[:user_id]
    else
      @ProxyUser = User.find_by_username(params[:ProxySubmission].downcase)
      @submission.user_id = @ProxyUser.id
    end
    
    @submission.submission_code = params[:script].read unless params[:script].blank?
    @submission.month = "november"
    @submission.league = "bronze"
    @submission.save
  end
end
