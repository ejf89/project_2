class Picture < ApplicationRecord
  belongs_to :user
  has_many :picture_tags
  has_many :tags, through: :picture_tags
  has_many :comments
  validate :valid_extension?
  # has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200", icon: "32x32" }


  def valid_extension?
    ext = self.image_url.split(".").last
    errors.add(:base, "File Invalid") unless %w( jpg jpeg png gif tiff ).include? ext.downcase
    # flash[:notice] = "Invalid file format."
  end

end
