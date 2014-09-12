class LinksController < ApplicationController

  def index
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @user = User.find(params[:user_id])
    @link = @user.links.new(link_params)
    if @link.save
      flash[:notice] = "New link has been created!"
    else
      render 'new'
    end
  end

private
  def link_params
    params.require(:link).permit(:user_id, :title, :url)
  end
end
