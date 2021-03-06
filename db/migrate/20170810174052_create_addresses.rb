class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.integer :state
      t.string :phone_number
      t.string :pincode
      t.boolean :is_primary
      t.timestamps
    end
  end
end
