class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
    	t.integer :post_id
    	t.integer :user_id
    	t.integer :tournament_id
    	t.integer :row_order

      t.timestamps null: false
    end
  end
end
