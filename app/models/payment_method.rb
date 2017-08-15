class PaymentMethod < ApplicationRecord
  enum pay_type: {cod: 0, online_payment: 1}
end