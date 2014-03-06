class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery
  helper_method :current_user
  helper_method :current_comments
  
  before_action :set_month_and_year

  private
  
  def current_user
    #Preventing if something goes wrong with cookies.
    begin
      @_current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      session[:user_id] = nil
      session[:change] = true
      redirect_to :login
    end
  end

  def current_comments(league, month)
    return Comment.find_all_by_league_and_month(league, month)
  end
  
  def require_login
    unless current_user
      redirect_to :login # halts request cycle
    end
  end
  
  def set_month_and_year
    @month = CurrentMonthYear.first.month
    @year = CurrentMonthYear.first.year
  end

end
