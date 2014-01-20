class AdminController < ApplicationController
  def index
    redirect_to :root unless current_user and current_user.admin
    @title = "Users Created All Time"
    @type = "users"
    if params[:sort]!='submissions'
      @all_users = User.all.order("#{params[:sort].blank? ? 'last_name' : params[:sort] } #{params[:reverse]=='true' ? 'DESC' : 'ASC' }") 
    else 
      @all_users = User.joins('join submissions on submissions.user_id = users.id').group("submissions.user_id").order("count(*) #{params[:reverse]=='true' ? 'DESC' : 'ASC' }") 
      @all_users = params[:reverse]!='true' ?  User.where.not(id: @all_users.collect {|u| [u.id]}) + @all_users : @all_users + User.where.not(id: @all_users.collect {|u| [u.id]})
    end 
  end
    
    def users
      @type = "users"
      if params[:time]
        @users = User.where("created_at >= ?", getDateSince(params[:time]))
        @title = 'Users Created ' + @title 
      else
        @user = User.all
        @title = "Users Created All Time"
      end
      render 'index'
    end
    
    def submissions
      @type = "submissions"
      if params[:time] != "alltime"
        @submissions = Submission.where("created_at >= ?", getDateSince(params[:time]))
        @title = 'Submissions Created ' + @title
      else
        @submissions = Submission.all
        @title = 'Submissions Created All Time'
      end
      render 'index'
    end  
    
    def getDateSince(dateFrom)
      case dateFrom
      when "day"
       time = Date.today.beginning_of_day
       @title = "Today"
     when "week"
       time = Date.today.beginning_of_week
       @title = "This Week" 
     when "month"
      time = Date.today.beginning_of_month
      @title = "This Month" 
      end
      time
    end
  
  end
  
