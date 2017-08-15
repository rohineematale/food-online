class HomeController < BaseController

  before_action :authenticate_user!, only: [:profile]

  def index
    @products = FoodItem.search(search_params)
  end

  def product_details
    @product = FoodItem.friendly.find(params[:slug])
  end

  def thank_you
    @order = Order.find(session[:order_id])
  end
  
  def profile
    @order = Order.find(session[:order_id])
  end
  

  private
    def search_params
      params[:search_text] ? params.require(:search_text) : nil
    end
end
