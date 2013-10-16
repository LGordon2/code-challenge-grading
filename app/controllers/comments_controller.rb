class CommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def new
  end

  def create
    @comment = Comment.new(comment_params)

    @comment.save
    redirect_to :back
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render "#{session[:month]}/#{session[:league]}"
  end
  private
    def comment_params
      params.require(:comment).permit(:month, :league, :comment, :name)

    end
end
