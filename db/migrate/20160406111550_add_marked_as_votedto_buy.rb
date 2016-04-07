class AddMarkedAsVotedtoBuy < ActiveRecord::Migration
  def change
  	add_column :buys, :marked_as_voted, :boolean, default: false
  end
end
