class CommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :verify_user, except: :create
  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to :back
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.comment = params[:comment][:comment]
    @comment.save
    redirect_to :back
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end
  private
    def comment_params
      params.require(:comment).permit(:month, :league, :comment, :name)
    end
    def verify_user
      redirect_to :back, notice: "Insufficient privileges" unless current_user.admin or Comment.find(params[:id]).user_id==current_user.id
    end
end
