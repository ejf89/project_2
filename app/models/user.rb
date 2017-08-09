class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validate :has_user_pic?
  has_many :pictures
  has_many :comments
  # has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"]



    def has_user_pic?
      if self.user_pic.empty?
        self.user_pic = 'smiley.png'
      end
    end

    def received_comments
      @pictures = self.pictures
      @pictures.collect do |picture|
        picture.comments.collect do |comment|
          comment.user_id != self.id
        end
      end
        #adjust return value to be comment content
    end




end
