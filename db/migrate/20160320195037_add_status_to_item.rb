class AddStatusToItem < ActiveRecord::Migration
  def change
  	add_column :items, :open_to_apply, :boolean, default: true
  	add_column :items, :open_to_pay, :boolean, default: false
  	add_column :items, :open_to_send, :boolean, default: false
  	add_column :items, :all_sent, :boolean, default: false
  end
end
