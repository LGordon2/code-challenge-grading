class UserController < ApplicationController
  before_action :require_login
  skip_before_action :verify_authenticity_token
  
  def update
    user = User.find(params[:id])
    user.update(admin: params['user']['admin'].to_s=="1")
    user.save
  end
  
  def submissions_history
    user = User.find_by(:first_name => params[:first], :last_name => params[:last])
    if user
      submissions = Submission.where(:user_id => user.id)
      winner = Challenge.where(:winner => user.id)
      submission_history = submissions.map{|submission| submission.month.capitalize + " - " + submission.league.capitalize}
      winner_history = winner.map{|win| winner.month.capitalize + " - " + winner.league.capitalize}
      render :json => {:submission_count => submissions.count , :submission_history => submission_history, :win_count => winner.count, :win_history => winner_history} 
        
     # render :json => submissions.to_json(:only => [:league])
    else
      render :json => {:name =>"Matt"}
    end
    
  end
end
