class TimeSlot < ApplicationRecord
  validates_presence_of :start_time, :start_date, :end_time, :end_date
  has_and_belongs_to_many :food_items

  def display_title
    "available from #{start_date.strftime('%d-%b-%y')} to #{end_date.strftime('%d-%b-%y')} between #{start_time.strftime('%I:%M %p')}-#{end_time.strftime('%I:%M %p')}"
  end
end
