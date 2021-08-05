class LikesController < ApplicationController
    before_action :find_post
    before_action :find_like, only: [:destroy]


  def create
    @gossip.likes.create(user_id: current_user.id)
    if already_liked?
        else
          @gossip.likes.create(user_id: current_user.id)
        end
        redirect_to gossip_path(@gossip)
   end

  def destroy
    if !(already_liked?)
      flash[:danger] = "impossible de dislike"
    else
      @like.destroy
    end
    redirect_to gossip_path(@gossip)
  end
  
  private
  
  def find_post
    @gossip = Gossip.find(params[:gossip_id])
  end

  def find_like
    @like = @gossip.likes.find(params[:id])
  end
  
  def already_liked?
    Like.where(user_id: current_user.id, gossip_id:
    params[:gossip_id]).exists?
  end
end
