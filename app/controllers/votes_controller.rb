class VotesController < ApplicationController

  def create
    @link = Link.find(params[:link_id])
    @vote = @link.votes.create
    if @vote.save
      flash[:notice] = "You have upvoted on this Link!"
      redirect_to links_path
    else
      flash[:alert] = "Ability to vote DISABLED!"
    end
  end



# private
#   def vote_params
#     params.require(:vote).permit(:user_id, :link_id)
#   end
end
