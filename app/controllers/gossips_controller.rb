class GossipsController < ApplicationController

  def index

  end

  def show
    @current_gossip = Gossip.find(params[:id])
  end

  def new
  end

  def create
    @gossip = Gossip.new_gossip(params)
    @gossip.user = current_user
    if @gossip.save
      flash[:success] = "Fichier enregistré"
      redirect_to root_path
    else
      flash[:danger] = "Champ non rempli correctement"
      render :new
    end
  end

  def edit
    @current_gossip = Gossip.find(params[:id])
  end

  def update
    @current_gossip = Gossip.find(params[:id])

    if @current_gossip.update(title: params[:title], content: params[:content])
      flash[:success] = "Fichier mis à jour !"
      redirect_to @current_gossip
    else
      flash[:danger] = "Champ non rempli correctement"
      render :edit
    end
  end

  def destroy
    @current_gossip = Gossip.find(params[:id])


    if @current_gossip.destroy
      flash[:success] = "Fichier supprimé"
      redirect_to @current_gossip
    else
      flash[:danger] = "Champ non rempli correctement"
      render :edit
    end
  end
end
