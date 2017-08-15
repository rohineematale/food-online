class Order < ApplicationRecord

  include OrdersHelper

  has_many :items, as: :itemable, dependent: :destroy
  has_one :payment_method
  has_one :invoice
  belongs_to :address
  belongs_to :user
  belongs_to :delivery_boy

  delegate :name, :address1, :address2, :city, :state, :phone_number, :pincode, to: :address, prefix: true, allow_nil: true
  delegate :email, to: :user, prefix: true, allow_nil: true
  delegate :name, :phone_number, :photo, to: :delivery_boy, prefix: true, allow_nil: true
  

  validates_presence_of :user, :items, :address, :payment_method, :status
  validates_associated :payment_method

  accepts_nested_attributes_for :payment_method

  before_create :verify_item_price, :set_total_price, :set_order_number
  after_create :create_invoice

  validate :validate_delivery_boy
  validate :is_order_deliverable?

  attr_accessor :manual_address

  enum status: {open_order: 0, pending_order: 1, confirm_order: 2, dispatched_order: 3, delivered: 4}

  def validate_delivery_boy
    self.errors.add(:delivery_boy, "can't be blank") if ((self.dispatched_order? || self.delivered?) && !self.delivery_boy.present?)
  end

  def is_order_deliverable?
    if self.address.present?
      is_deliverable = Locality.where(pincode: self.address_pincode, is_deliverable: true).present?
      self.errors.add(:address, "We don't deliver to this address") unless is_deliverable
    end
  end

  def verify_item_price
    self.items.map{|i| i.save}
  end

  def set_total_price
    amount = 0
    self.items.map{|item| amount+= (item.price * item.quantity)}
    self.total_amount = amount
  end

  def pay_type
    self.payment_method.pay_type
  end

  def set_order_number
    time = Time.now.to_i.to_s
    rand_string = rand.to_s[2..5]
    self.order_number = time + rand_string
  end

  def create_invoice
    invoice = self.build_invoice(self.address.attributes.except("id", "created_at", "updated_at", "is_primary"))
    invoice.total_amount = self.total_amount
    invoice.user_id = self.user_id
    invoice.save
  end

  def shipping_address
    return get_address(self.invoice)
  end
end
