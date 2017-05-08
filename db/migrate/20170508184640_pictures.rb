class Pictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :image_url
      t.string :title
      t.integer :user_id
    end
  end
end
