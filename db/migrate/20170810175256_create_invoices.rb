class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.integer :order_id
      t.integer :user_id
      t.float :total_amount
      t.float :total_items
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.integer :state
      t.string :phone_number
      t.string :pincode
      t.timestamps
    end
  end
end
