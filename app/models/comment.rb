class Comment < ActiveRecord::Base
  belongs_to :user
  def all_comments_by_month_and_league(month, league)
    Comment.find_all_by_month_and_league(month, league)
  end
end
