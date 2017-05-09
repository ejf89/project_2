class CommentsController < ApplicationController

  def index
  end

  def new
  end

  def create
      @comment = Comment.new(comment_params)
      @picture = Picture.find(params["comment"]["picture_id"])

      if @comment.save
          redirect_to user_picture_url(current_user.id, @picture)
      else
          flash[:notice] = "Please enter a commento"
          redirect_to user_picture_url(current_user.id, @picture)
      end
  end

  def show
  end

  private

  def comment_params
      params.require(:comment).permit(:content, :user_id, :picture_id)
  end


end
