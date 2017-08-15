class AddMigrationAddIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :addresses, :user_id
    add_index :carts, :user_id
    add_index :invoices, :user_id
    add_index :invoices, :order_id
    add_index :items, :food_item_id
    add_index :items, [:itemable_type, :itemable_id]
    add_index :localities, [:pincode, :is_deliverable]
    add_index :orders, :user_id
    add_index :payment_methods, :order_id
    add_index :photos, [:imageable_id, :imageable_id]
    add_index :time_slots, [:start_time, :end_time, :start_date, :end_date], name: "time_slot_search"
  end
end
