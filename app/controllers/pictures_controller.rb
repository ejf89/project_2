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

  # if !params[:picture]["image"].empty?
        @picture = Picture.new(picture_params)
        if !params[:tag][:name].empty?
          @tag = Tag.new(name: params[:tag][:name])
          if @tag.valid?
            @tag.save
          else
            @tag = Tag.find_by(name: params[:tag][:name])
          end
          @picture.update(tag_ids: @picture.tag_ids << @tag.id)
        end
            if @picture.save
                redirect_to user_picture_path(@picture.user.id, @picture.id)
            else
                flash[:notice] = "Are you sure thats the right address?"
                redirect_to user_path(params["picture"]["user_id"], anchor: 'bottom')
            end
    # else
    #     flash[:notice] = "Please enter a picture url!"
    #     redirect_to user_path(params["picture"]["user_id"], anchor: 'bottom')
    # end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to user_path(current_user)
  end


  private

  def picture_params
    params.require(:picture).permit(:image_url, :image, :title, :user_id, :tag_ids =>[])
  end


end
