class CreateDeliveryBoys < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_boys do |t|
      t.string :name
      t.string :phone_number
      t.timestamps
    end
  end
end
