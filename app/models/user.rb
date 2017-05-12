class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  # validates :has_user_pic?
  has_many :pictures
  has_many :comments



    def has_user_pic?
      binding.pry
      # if @user(params[:user_pic]).empty?
      # end
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
