class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :recipient_id
      t.integer :creator_id
      t.string :action
      t.string :url

      t.timestamps null: false
    end
  end
end
