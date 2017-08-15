class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :food_item_id
      t.integer :price
      t.integer :quantity
      t.integer :itemable_id
      t.string :itemable_type
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
