class UsersController < ApplicationController
before_action :authorize_user, only: [:index, :show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    @trending_tags = Tag
    @user = User.find(params[:id])
    @pictures = Picture.where(user_id: @user.id)
    @sorted = @pictures.sort_by {|picture| picture.id}
    @picture = Picture.new
    @tags = @pictures.collect{|picture| picture.tags}.flatten

    #collect comments from pictures
    @comments = @pictures.map {|x| x.comments}
    @comments.flatten!
    @comments.delete_if {|comment| comment.user_id == @user.id}

  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :user_pic)
  end

end
