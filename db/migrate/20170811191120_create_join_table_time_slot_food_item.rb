class CreateJoinTableTimeSlotFoodItem < ActiveRecord::Migration[5.0]
  def change
    create_join_table :time_slots, :food_items do |t|
      t.index [:time_slot_id, :food_item_id]
      t.index [:food_item_id, :time_slot_id]
    end
  end
end
