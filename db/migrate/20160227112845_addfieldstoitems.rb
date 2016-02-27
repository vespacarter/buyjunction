class Addfieldstoitems < ActiveRecord::Migration
  def change
  	add_column :items, :expiration_date, :date
  	add_column :items, :expiration_time, :time
  end
end
