class Cart < ApplicationRecord
  has_many :items, as: :itemable, dependent: :destroy
  before_save :update_items

  def update_items
    self.items.map{|item| item.save}
    self.total_amount = self.items.sum("price * quantity")
  end
end
