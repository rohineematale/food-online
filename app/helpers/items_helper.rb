module ItemsHelper

  def get_product_quantity(product_id)
    @cart.items.find_by_food_item_id(product_id).quantity
  end
end
