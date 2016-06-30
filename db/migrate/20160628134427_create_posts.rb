class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.text :first_draft
    	t.text :content
    	t.integer :user_id
    	t.integer :assignment_id

      t.timestamps null: false
    end
  end
end
