class Tag < ApplicationRecord
  has_many :picture_tags
  has_many :pictures, through: :picture_tags

  validates :name, uniqueness: true


  def self.most_popular
     mapped = Tag.all.limit(5).sort_by do |tag|
          tag.pictures.length
      end
  end



      def self.trending
      
          @pictures = Picture.all[-10..-1]

         @sorted =  @pictures.sort_by do |pic|
              pic.comments.length
          end
        @results = @sorted.reverse.map do |picture|
              picture.tags
          end
          @results.flatten!.uniq
      end


end
