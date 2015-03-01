class AuthenticationController < ApplicationController

  def create
    mountaineer = Mountaineer.find_by(name: params[:name])
    if mountaineer && mountaineer.authenticate(params[:password])
      session[:mountaineer_id] = mountaineer.id
      flash[:notice] = "logged in"
      redirect_to root_path
    else
      flash[:notice] = "are you sure you're a mountaineer?"
      render :new
    end
  end

  def new
    session[:mountaineer_id] = current_mountaineer
  end

  def destroy
    session[:mountaineer_id] = nil
    redirect_to root_path
  end
end
