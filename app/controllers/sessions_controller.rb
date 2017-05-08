class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user.present? && @user.authenticate(params[:user][:username])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signup_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
