class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :description
      t.text :image_data
      t.string :slug

      t.timestamps
    end
    add_index :posts, :slug, unique: true
  end
end
