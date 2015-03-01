class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_mountaineer

  def current_mountaineer
    if session[:mountaineer_id].present?
      User.find(session[:mountaineer_id])
    end
  end
end
