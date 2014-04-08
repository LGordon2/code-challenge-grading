class AdminController < ApplicationController
  
  before_action :require_admin
  #before_action :get_page_count_for_users, 
  before_action :set_default_settings
  
  def index
    @title = "Users Created All Time"
    @type = "users"
    @page_count = (User.count.to_f / @pagination_size.to_f).ceil
    if params[:sort]!='submissions'
      @all_users = User.order("#{params[:sort].blank? ? 'first_name' : params[:sort] } #{params[:reverse]=='true' ? 'DESC' : 'ASC' }").limit(@pagination_size).offset(@pagination_size*(@page_number-1))
    else
      @all_users = User.joins('join submissions on submissions.user_id = users.id').group("submissions.user_id").order("count(*) #{params[:reverse]=='true' ? 'DESC' : 'ASC' }")
      @all_users = params[:reverse]!='true' ?  User.where.not(id: @all_users.collect {|u| [u.id]}) + @all_users : @all_users + User.where.not(id: @all_users.collect {|u| [u.id]})
      @all_users = @all_users.slice(@pagination_size*(@page_number-1), @pagination_size)
    end
  end

  def users
    @type = "users"
    if params[:time]
      @all_users = User.where(created_at: getDateSince(params[:time]))
      @title = 'Users Created ' + @title
    else
      @all_users = User.all
      @title = "Users Created All Time"
    end
    render 'index'
  end

  def submissions
    @type = "submissions"
    if params[:time] != "alltime"
      @submissions = Submission.where(created_at: getDateSince(params[:time]))
      @title = 'Submissions Created ' + @title
    else
      @submissions = Submission.all
      @title = 'Submissions Created All Time'
    end
    @page_count = @submissions.count
    render 'index'
  end
  
  def set_current_month_year
    set_params = params.require(:current_month_year).permit(:month,:year)
    unless Challenge.where(month: set_params['month'].downcase, year: set_params['year'].to_i).blank?
      CurrentMonthYear.first.update(month: set_params['month'].downcase, year: set_params['year'].to_i)
    else
      error_msg = "No challenge exists for this month/year combination."
    end
    redirect_to admin_path, flash: {error: error_msg}
  end

  private

  def getDateSince(dateFrom)
    case dateFrom
    when "day"
      time = (Date.today.beginning_of_day..Date.today.end_of_day)
      @title = "Today"
    when "week"
      time = (Date.today.beginning_of_week.beginning_of_day..Date.today.end_of_week.end_of_day)
      @title = "This Week"
    when "month"
      time = (Date.today.beginning_of_month.beginning_of_day..Date.today.end_of_month.end_of_day)
      @title = "This Month"
    end
    time
  end

  def require_admin
    redirect_to :root unless current_user and current_user.admin
  end
  
  def get_page_count_for_users
    #@page_count = 
  end
  
  def set_default_settings
    @pagination_size = 10
    @page_number = params[:page].blank? ? 1 : params[:page].to_i
    @max_pagination_pages = 10
  end
end

