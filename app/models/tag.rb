class Tag < ApplicationRecord
  has_many :picture_tags
  has_many :pictures, through: :picture_tags


  def self.most_popular
     mapped = Tag.all.map do |tag|
          tag.pictures.length
      end
      tag_id = mapped.index(mapped.max)
      Tag.all[tag_id]
  end
end
