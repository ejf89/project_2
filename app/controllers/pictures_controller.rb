class PicturesController < ApplicationController

  def new
    @picture = Picture.new(picture_params)
  end


  def show
  end

  def create
    binding.pry
  end



  private

  def picture_params
    params.require(:picture).permit(:image_url, :title, :user_id)
  end


end
