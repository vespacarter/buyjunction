class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      # full user data
      t.string :fullname
      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode
      
      t.timestamps null: false
    end
  end
end
