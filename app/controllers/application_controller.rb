class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?




  private

  def logged_in?
    !!session[:user_id]
  end

  def current_user
      if User.find_by(params[:id])
        current_user = User.find(params[:id])
      else
        redirect_to signup_path
      end
  end


end
