class RemoveexpiresAtfromitem < ActiveRecord::Migration
  def change
  	remove_column :items, :expires_at
  end
end
