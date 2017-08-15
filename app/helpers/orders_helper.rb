module OrdersHelper

  def get_address(add)
    str = ""
    str += "<h4>#{add.name}</h4>" if add.name.present?
    str += "#{add.phone_number}</br>" if add.phone_number.present?
    str += "#{add.address1}</br>" if add.address1.present?
    str += "#{add.address2}</br>" if add.address2.present?
    str += "#{add.city}</br>" if add.city.present?
    str += "#{add.pincode}</br>" if add.pincode.present?
    str += "#{add.state}</br>" if add.state.present?
    return str.html_safe
  end
end
