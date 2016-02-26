class CreateBuys < ActiveRecord::Migration
  def change
    create_table :buys do |t|

      t.timestamps null: false
    end
  end
end
