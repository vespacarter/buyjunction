class Addcountertoitems < ActiveRecord::Migration
  def change
  	add_column :items, :number_of_buyers, :integer, :default => 0
  end
end
