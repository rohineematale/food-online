class OrdersController < BaseController

  before_action :authenticate_user!

  def index
    @order = current_user.orders.order("created_at DESC")
  end

  def new
    redirect_to carts_path and return unless @cart.items.present?
    @order = Order.new
    @order.build_address
    @order.build_payment_method
  end

  def show
    @order = Order.includes(items: [food_item: [:photo]]).where(id: params[:id], user_id: current_user.id).last
    @delivery_boy = @order.delivery_boy
  end

  def create
    @order = current_user.orders.build(order_params)
    @order.items = current_cart.items
    if @order.save
      session[:order_id] = @order.id
      if @order.pay_type == "cod"
        @order.pending_order!
        redirect_to thank_you_path
      else
        @order.confirm_order!
        redirect_to thank_you_path
      end
    else
      flash[:danger] = @order.errors.full_messages
      render :new
    end
  end

  private
    def order_params
      params.require(:order).permit(:address_id, payment_method_attributes: [:pay_type])
    end
end