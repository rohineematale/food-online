class CreateLocalities < ActiveRecord::Migration[5.0]
  def change
    create_table :localities do |t|
      t.string :address
      t.string :pincode
      t.string :city
      t.integer :state
      t.boolean :is_deliverable
      t.timestamps
    end
  end
end
