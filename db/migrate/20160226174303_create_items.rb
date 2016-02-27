class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
 		  t.string :title
 		  t.string :description
 		  t.integer :owner
 		  t.string :seller
 		  t.string :seller_url
 		  t.integer :prize
 		  t.integer :min_units
 		  t.datetime :expires_at
 		  
	      t.timestamps null: false
    end
  end
end
