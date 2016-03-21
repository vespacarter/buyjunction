class AddClosedStatusToItem < ActiveRecord::Migration
  def change
  	add_column :items, :closed_status, :boolean, default: false
  end
end
