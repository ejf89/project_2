class PictureTag < ApplicationRecord
  belongs_to :pictures
  belongs_to :tags
end
