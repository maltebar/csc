class CreateForumPostReplies < ActiveRecord::Migration
  def change
    create_table :forum_post_replies do |t|
    	t.text :content
    	t.integer :forum_post_id
    	t.integer :user_id

      t.timestamps null: false
    end
  end
end
