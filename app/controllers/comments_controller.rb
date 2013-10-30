class CommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :verify_user, except: [:create, :show, :created_time, :updated_time]
  before_action :set_comment, except: [:create, :show]
  
  def new
  end

  def created_time
    render json: @comment.created_at
  end
  
  def updated_time
    render json: @comment.updated_at
  end
  
  def show
    render json: Comment.where(month: params[:month], league: params[:league])
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

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:month, :league, :comment, :name)
  end

  def verify_user
    redirect_to :back, notice: "Insufficient privileges" unless current_user.admin or Comment.find(params[:id]).user_id==current_user.id
  end
end
