class Item < ApplicationRecord
  belongs_to :itemable, polymorphic: true, optional: true
  belongs_to :food_item
  
  delegate :name, :price, :slug, to: :food_item, prefix: true

  validates_presence_of :food_item_id, :price, :quantity, :itemable_id, :itemable_type

  before_validation :set_product_price

  enum status: {added_to_cart: 0, open_order: 1, pending_order: 2, confirm_order: 3, dispatched_order: 4}

  def set_product_price
    food_item = FoodItem.find_by_id(self.food_item_id)
    self.price = food_item.price if (food_item && (self.added_to_cart? || self.open_order?))
  end

end