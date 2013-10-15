class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :current_comments

  private
  
  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_comments(league, month)
    return Comment.find_all_by_league_and_month(league, month)
  end
  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_url # halts request cycle
    end
  end

end
