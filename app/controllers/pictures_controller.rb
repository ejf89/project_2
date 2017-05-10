class PicturesController < ApplicationController

  def new
    @picture = Picture.new(picture_params)
  end

  def show
      @user = User.find(params[:user_id])
      @picture = Picture.find(params[:id])
      @comment = Comment.new
      @comments = @picture.comments
  end

  def create
    @picture = Picture.create(picture_params)
    if !params[:tag][:name].empty?
      @tag = Tag.new(name: params[:tag][:name])
      if @tag.valid?
        @tag.save
      else
        @tag = Tag.find_by(name: params[:tag][:name])
      end
      @picture.update(tag_ids: @picture.tag_ids << @tag.id)
    end
    #adding each tag checked or created into the tag_ids array
    redirect_to user_path(current_user)
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to user_path(current_user)
  end


  private

  def picture_params
    params.require(:picture).permit(:image_url, :title, :user_id, :tag_ids =>[])
  end


end
