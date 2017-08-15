module Admin::BaseHelper

  def active_nav(menu)
    params[:controller] == "admin/#{menu}" ? "active" : ""
    # return case menu
    # when params[:controller] == "admin/orders"
    #   "active"
    # when params[:controller] == "admin/delivery_boys"
    #   "active"
    # when params[:controller] == "admin/food_items"
    #   "active"
    # when params[:controller] == "admin/localities"
    #   "active"
    # when params[:controller] == "admin/time_slots"
    #   "active"
    # else
    #   ""
    # end
  end
end
