class AddStatusToBuys < ActiveRecord::Migration
def change
  	add_column :buys, :payment_sent, :boolean, default: false
  	add_column :buys, :payment_received, :boolean, default: false
  end
end
