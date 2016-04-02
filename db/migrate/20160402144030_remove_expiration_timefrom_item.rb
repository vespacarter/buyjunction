class RemoveExpirationTimefromItem < ActiveRecord::Migration
  def change
  	remove_column :items, :expiration_time
  end
end
