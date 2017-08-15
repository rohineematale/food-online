class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_cart, :if => :devise_controller?

  def set_cart
    @cart = current_cart
  end

  def current_cart
    if user_signed_in?
      cart = Cart.includes(items: [:food_item]).where(user_id: current_user.id).last
      if session[:cart_id].present? and cart.present?
        session_cart = Cart.find_by_id session[:cart_id]
        current_user.cart.items << session_cart.items if session_cart.present?
      elsif session[:cart_id].present?
        current_user.cart = Cart.find session[:cart_id]
        cart = current_user.cart
      end
      associate_include = true
    elsif session[:cart_id].present?
      cart = Cart.includes(items: [:food_item]).where(id: session[:cart_id]).last
      associate_include = true
    end
    unless cart.present?
      cart = Cart.new
      cart.user_id = current_user.id if user_signed_in?
      cart.save
    end
    session[:cart_id] = cart.id
    cart = Cart.includes(items: [:food_item]).where(id: cart.id).last unless associate_include
    return cart
  end
end
