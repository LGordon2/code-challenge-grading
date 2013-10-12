class CommentsController < ApplicationController

  def new
  end

  def create
    @comment = Comment.new(comment_params)

    @comment.save
    render "#{session[:month]}/#{session[:league]}"
  end

  private
    def comment_params
      params.require(:comment).permit(:month, :league, :comment, :name)

    end
end
