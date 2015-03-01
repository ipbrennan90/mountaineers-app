class RegistrationController < ApplicationController
  def new
    @mountaineer = Mountaineer.new
  end

  def create
    @mountaineer = Mountaineer.new(mountaineer_params)
    if @mountaineer.save
      session[:mountaineer_id] = @mountaineer.id
      flash[:notice] = "thanks for signing up"
      redirect_to root_path
    else
      render :new
    end
  end

  private


  def mountaineer_params
    params.require(:mountaineer).permit(:name, :password)
  end
end
