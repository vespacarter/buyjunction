class ChangeIdFormatInBuyAndItem < ActiveRecord::Migration
  def change
  	def up
    	change_column :buys, :user_id, :integer
  	end

  	def down
    	change_column :buys, :user_id, :string
  	end

  	def up
    	change_column :items, :user_id, :integer
  	end

  	def down
    	change_column :items, :user_id, :string
  	end
  end
end
