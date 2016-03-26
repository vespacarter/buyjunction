class AddStatusToBuy < ActiveRecord::Migration
  def change
  	add_column :buys, :item_sent, :boolean, default: false
  	add_column :buys, :item_received, :boolean, default: false
  end
end
