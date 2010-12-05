class CartsController < ApplicationController
  
  def show
    @cart = current_cart
  end
  
  def reset
    if @cart = current_cart
      @cart.destroy
    end
    session[:cart_id] = nil
    session[:shipping_price] = nil
    redirect_to products_path
  end
  
  def shipping
    @cart = current_cart
  end
  
  def update
    @cart = current_cart
    if @cart.update_attributes(params[:cart]) && @cart.address.present?
      calculate_shipping
      flash[:success] = "Shipping calculated."
      redirect_to @cart
    else
      render 'shipping'
    end
  end
  
  
end
