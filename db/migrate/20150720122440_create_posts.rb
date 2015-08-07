class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.integer :current_user_id
      t.string :user_name
      t.text   :content
      t.string :min
      t.text   :title
      t.string :my_image

      t.timestamps null: false
    end
  end
end
