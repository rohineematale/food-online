class Address < ApplicationRecord
  belongs_to :user
  validates_presence_of :user, :name, :phone_number, :address1, :address2, :city, :state, :pincode

  include StateEnum
  
end
