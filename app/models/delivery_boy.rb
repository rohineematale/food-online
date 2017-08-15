class DeliveryBoy < ApplicationRecord
  has_one :photo, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :photo
  validates_presence_of :name, :phone_number
end
