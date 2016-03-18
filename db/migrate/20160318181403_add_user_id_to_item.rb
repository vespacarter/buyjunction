class AddUserIdToItem < ActiveRecord::Migration
  def change
  	add_column :items, :user_id, :string
  end
end
