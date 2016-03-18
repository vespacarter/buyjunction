class AddUserIdToBuy < ActiveRecord::Migration
  def change
  	add_column :buys, :user_id, :string
  end
end
