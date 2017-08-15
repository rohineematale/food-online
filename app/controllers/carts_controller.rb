class CartsController < BaseController

  def index
    
  end

  def update
    @item = @cart.items.find_or_initialize_by(food_item_id: cart_params[:food_item_id])
    @item.quantity = @item.quantity + cart_params[:quantity].to_i
    if @item.quantity == 0
      @item.destroy if @item.id.present?
    else
      @item.save
    end
    @cart = Cart.find @cart
    @cart.save
  end

  private
    def cart_params
      params.require(:cart).permit(:food_item_id, :quantity)      
    end
end
