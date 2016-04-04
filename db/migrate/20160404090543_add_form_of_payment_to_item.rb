class AddFormOfPaymentToItem < ActiveRecord::Migration
  def change
  	add_column :items, :form_of_payment, :string
  	add_column :items, :payment_details, :string
  end
end
