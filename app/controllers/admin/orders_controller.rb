class Admin::OrdersController < Admin::BaseController

  before_action :set_order, only: [:show, :edit, :update]

  layout "admin"
  
  def index
    @orders = Order.order("created_at DESC")
  end

  def show; end

  def edit; end

  def update
    @order.update_attributes(order_param)
    if @order.errors.present?
      flash[:alert] = @order.errors.full_messages
      redirect_to edit_admin_order_path(@order)
    else
      redirect_to edit_admin_order_path(@order), notice: "Order updated Successfully"
    end
  end

  private
    def set_order
      @order = Order.find params[:id]
    end

    def order_param
      params.require(:order).permit(:status, :delivery_boy_id)
    end
end
