class CreateTimeSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :time_slots do |t|
      t.time :start_time
      t.time :end_time
      t.date :start_date
      t.date :end_date
      t.boolean :is_special
      t.boolean :is_all_day
      t.timestamps
    end
  end
end
