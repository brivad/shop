class CartsController < ApplicationController
  
  def show
    @cart = current_cart
  end
  
  def reset
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to products_path
  end
  
end
