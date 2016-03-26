class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :from
      t.string :subject
      t.string :body
	  t.boolean :read, default: false      
      t.timestamps null: false
    end
  end
end
