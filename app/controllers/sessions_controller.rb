class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in(user)
      flash[:success] = "Tonga soa #{user.first_name}"
      redirect_to root_path
    else
      flash[:danger] = "Email ou mot de passe incorrect"
      render :new
    end
  end

  def destroy
    if session.delete(:user_id)
      flash[:success] = "Vous avez été deconnecté"
      redirect_to root_path
    end
  end

end
