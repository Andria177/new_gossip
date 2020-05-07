class CommentsController < ApplicationController
  def edit
    @current_comment = Comment.find(params[:id])
  end

  def update
    @current_comment = Comment.find(params[:id])

    if @current_comment.update(content: params[:content])
      flash[:success] = "Nouveau commentaire enregistré !"
      redirect_to gossip_path(params[:gossip_id])
    else
      flash[:danger] = "Champ non rempli correctement"
      redirect_to edit_gossip_comment_path(params[:gossip_id])
    end
  end

  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new_comment(params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Commentaire pris en compte!"
      redirect_to gossip_path(params[:gossip_id])
    else
      flash[:danger] = "Champ non rempli correctement"
      redirect_to new_gossip_comment_path(params[:gossip_id])
    end
  end

  def destroy
    @current_comment = Comment.find(params[:id])


    if @current_comment.destroy
      flash[:success] = "Potin supprimé!"
      redirect_to gossip_path(params[:gossip_id])
    else
      flash[:danger] = "Error"
      render gossip_path(params[:gossip_id])
    end
  end

  def show
  end
end
