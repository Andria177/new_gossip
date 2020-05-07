class UsersController < ApplicationController
  def index
  end

  def show
    @current_user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], age: params[:age], city_id: params[:city], description: params[:description])

    if @user.save
      flash[:success] = "Vous êtes enregistré(e)!"
      redirect_to root_path
    else
      flash[:danger] = "Information incomplète ou incorrecte. Recommencez s'il vous plait!"
      render :new
    end
  end

  def edit
  end
end
