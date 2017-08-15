class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :order_number
      t.integer :address_id
      t.integer :address_id
      t.float :total_amount
      t.integer :delivery_boy_id
      t.integer :status, default: 0
      t.datetime :placed_at
      t.timestamps
    end
  end
end