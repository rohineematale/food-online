class Invoice < ApplicationRecord
  include StateEnum
  
  belongs_to :user
  belongs_to :order
  validates_presence_of :user, :name, :phone_number, :address1, :address2, :city, :state, :pincode

end
