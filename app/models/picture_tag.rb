class PictureTag < ApplicationRecord
  belongs_to :picture
  belongs_to :tag
  has_many :comments
end
