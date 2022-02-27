class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.text :title
      t.text :content
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
