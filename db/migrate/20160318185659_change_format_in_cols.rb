class ChangeFormatInCols < ActiveRecord::Migration
  def change
    change_column :buys, :user_id, :integer
    change_column :items, :user_id, :integer
  end
end
