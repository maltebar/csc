class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
    	t.integer :assignment_id
    	t.integer :gd_percent
    	t.integer :ge_percent
    	t.integer :ww_percent
    	t.integer :gr_percent
    	t.integer :read_percent
      t.boolean :closed

      t.timestamps null: false
    end
  end
end
