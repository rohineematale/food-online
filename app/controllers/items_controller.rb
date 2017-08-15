class ItemsController < BaseController

  before_action :set_record, only: [:destroy]

  def create
    @item = @cart.items.build(food_item_params)
    @item.save
    @cart.save
  end

  def destroy
    @item.destroy
    @cart = Cart.find @cart
    @cart.save
  end

  private
    def food_item_params
      params.require(:item).permit(:food_item_id, :quantity)
    end

    def set_record
      @item = Item.find params[:id]
    end
end
