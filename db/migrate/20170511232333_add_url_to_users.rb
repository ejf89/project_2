class AddUrlToUsers < ActiveRecord::Migration[5.1]
  def change
      add_column :users, :user_pic, :string, :default => "smiley.png"
  end
end
