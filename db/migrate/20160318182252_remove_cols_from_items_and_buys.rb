class RemoveColsFromItemsAndBuys < ActiveRecord::Migration
  def change
  	remove_column :items, :owner
  	remove_column :buys, :buyer_id
  end
end
