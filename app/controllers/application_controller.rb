class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user, :authorize_user




  private

  def logged_in?
    !!session[:user_id]
  end

  def authorize_user
    unless logged_in?
      redirect_to signup_path
      flash[:notice] = "Please Log In"
    end
  end

  def current_user
      @current_user ||= User.find(session[:user_id])
  end


end
