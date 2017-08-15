class FoodItem < ApplicationRecord
  has_one :photo, as: :imageable, dependent: :destroy
  has_and_belongs_to_many :time_slots, dependent: :destroy

  validates_presence_of :name, :price, :description
  validates_presence_of :photo

  accepts_nested_attributes_for :photo
  accepts_nested_attributes_for :time_slots

  validates_associated :photo
  
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  
  def product_image(size)
    self.photo.present? ? self.photo.image(size) : ""
  end

  def slug_candidates    
    [
      :name,
      [:name, :price],
      [:name, :price, :id]
    ]
  end

  def self.search(search_text=nil)
    return FoodItem.includes(:photo, :time_slots) unless search_text.present?
    FoodItem.where("name like ? or description like ?", "%#{search_text}%", "%#{search_text}%")
  end

  def is_food_available?
    t = Time.now.utc
    current_time = Time.new(2000, 01, 01, t.hour, t.min, t.sec, t.utc_offset)
    result = FoodItem.joins(:time_slots).where("food_items.id = ? and time_slots.start_time < ? and time_slots.end_time > ? and time_slots.start_date <= ? and time_slots.end_date >= ?", self.id, current_time, current_time, Date.today, Date.today).present?
  end
end
