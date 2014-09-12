class CommentsController < ApplicationController

  before_action :find_params

  def index
    @comments = @commentable.comments
  end

  def new
    # @link = Link.find(params[:link_id])
    @comment = @commentable.comments.new
  end

  def create
    if params[:link_id]
      @commentable = Link.find(params[:link_id])
    elsif params[:comment_id]
      @commentable = Comment.find(params[:comment_id])
    end
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "You have commented!"
      if @comment.commentable_type == 'Link'
        redirect_to link_path(@comment.commentable_id)
      else
        redirect_to link_path(@commentable.commentable_id)
      end
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

  def find_params
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
    # poly_class = [Link, Comment].detect { |type| params["#{type.name.underscore}_id"]}
    # @commentable = poly_class.find(params["#{poly_class.name.underscore}_id"])
  end
end
