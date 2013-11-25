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
    CommentMailer.new_comment(User.find(@comment.user_id), @comment).deliver
    @comment.save
    if @comment.reply_id
	CommentMailer.reply_comment(User.find(Comment.find(@comment.reply_id).user_id), User.find(@comment.user_id),Comment.find(@comment.reply_id), @comment.comment).deliver
    end
    redirect_to :back
  end

  def update
    @comment = Comment.find(params[:id])
    CommentMailer.updated_comment(User.find(@comment.user_id), @comment, params[:comment][:comment]).deliver
    @comment.comment = params[:comment][:comment]
    @comment.save
    redirect_to :back
  end

  def destroy
    @comment = Comment.find(params[:id])
    @replies = Comment.where(:reply_id => params[:id])
    CommentMailer.deleted_comment(User.find(@comment.user_id), @comment, current_user).deliver
    @replies.each do |reply|
	reply.destroy
    end
    @comment.destroy
    
    redirect_to :back
  end
  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    
    params.require(:comment).permit(:comment,:month,:league,:name,:reply_id)
  end
 
  def verify_user
    redirect_to :back, notice: "Insufficient privileges" unless current_user.admin or Comment.find(params[:id]).user_id==current_user.id
  end
end
