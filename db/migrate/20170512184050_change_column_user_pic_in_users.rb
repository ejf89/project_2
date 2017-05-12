class ChangeColumnUserPicInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :user_pic, :string, :default => nil
  end
end
