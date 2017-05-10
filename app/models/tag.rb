class Tag < ApplicationRecord
  has_many :picture_tags
  has_many :pictures, through: :picture_tags

  validates :name, uniqueness: true 


  def self.most_popular
     mapped = Tag.all.sort_by do |tag|
          tag.pictures.length
      end
       mapped[-3..-1]
  end


  def self.trending
      @pictures = Picture.all[-10..-1]
      @pictures.sort_by do |pic|
          pic.comments.length
      end
     @pictures.first.tags.each do |tag|
         tag.name
     end
  end


end
