class CommentsController < ApplicationController

  def index
    @link = Link.find(params[:link_id])
    @comments = @link.comments
  end

  def new
    @link = Link.find(params[:link_id])
    @comment = Comment.new
  end

  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "You have commented!"
      redirect_to link_comments_path
    else
      render 'new'
    end
  end

  def edit
    @link = Link.find(params[:link_id])
    @comment = @link.comments.find(params[:id])
  end

  def update
    @link = Link.find(params[:link_id])
    @comment = @link.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = 'Comment updated!'
      redirect_to link_comments_path
    else
      flash[:notice] = 'Update Comment Error'
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment deleted!'
    redirect_to link_comments_path
  end

private

  def comment_params
    params.require(:comment).permit(:link_id, :comment)
  end
end
