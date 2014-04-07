class AdminController < ApplicationController
  
  before_action :require_admin
  
  def index
    @title = "Users Created All Time"
    @type = "users"
    if params[:sort]!='submissions'
      @all_users = User.order("#{params[:sort].blank? ? 'first_name' : params[:sort] } #{params[:reverse]=='true' ? 'DESC' : 'ASC' }")
    else
      @all_users = User.joins('join submissions on submissions.user_id = users.id').group("submissions.user_id").order("count(*) #{params[:reverse]=='true' ? 'DESC' : 'ASC' }")
      @all_users = params[:reverse]!='true' ?  User.where.not(id: @all_users.collect {|u| [u.id]}) + @all_users : @all_users + User.where.not(id: @all_users.collect {|u| [u.id]})
    end
  end

  def users
    @type = "users"
    if params[:time]
      @all_users = User.where("created_at >= ?", getDateSince(params[:time]))
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
      time = Date.today.beginning_of_day
      @title = "Today"
    when "week"
      time = (Date.today.beginning_of_week..Date.today.end_of_week)
      @title = "This Week"
    when "month"
      time = (Date.today.beginning_of_month..Date.today.end_of_month)
      @title = "This Month"
    end
    time
  end

  def require_admin
    redirect_to :root unless current_user and current_user.admin
  end
end

