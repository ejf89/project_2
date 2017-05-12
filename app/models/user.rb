class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  has_many :pictures
  has_many :comments

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
