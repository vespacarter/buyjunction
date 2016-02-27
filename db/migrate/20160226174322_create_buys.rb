class CreateBuys < ActiveRecord::Migration
  def change
    create_table :buys do |t|
      t.integer :buyer_id
      t.integer :item_id
      t.timestamps null: false
    end
  end
end
