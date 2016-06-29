class CreateForumPosts < ActiveRecord::Migration
  def change
    create_table :forum_posts do |t|
    	t.string :title
    	t.text :content
    	t.integer :user_id

      t.timestamps null: false
    end
  end
end
