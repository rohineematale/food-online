class BaseController < ApplicationController

  before_action :set_cart

  def set_cart
    @cart = current_cart
  end
end
