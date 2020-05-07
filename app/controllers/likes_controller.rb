class LikesController < ApplicationController
include SessionsHelper

  def create
    @like = Like.new(user_id: current_user.id, gossip_id: params[:gossip_id])
    @like.user = current_user
    if @like.save
      flash[:success] = "like accepté"
      redirect_to request.referrer
    else
      flash[:danger] = "dommage"
      redirect_to root_path
    end
  end

  def update
  end

  def destroy
    @current_like = Like.find(params[:id])


    if @current_like.destroy
      flash[:success] = "Le like supprimé !"
      redirect_to request.referrer
    else
      flash[:danger] = "Error"
      render gossip_path(params[:gossip_id])
    end
  end

private

  def like_params
    params.permit(:user_id, :gossip_id)
  end

end
