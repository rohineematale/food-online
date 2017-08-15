class CreatePaymentMethods < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_methods do |t|
      t.integer :pay_type
      t.integer :order_id
      t.string :payment_status
      t.text :payment_response
      t.timestamps
    end
  end
end