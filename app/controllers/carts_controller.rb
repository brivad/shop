class CartsController < ApplicationController
  
  def show
    @title = "Shopping cart"
    @cart = current_cart
    redirect_to(products_path, :notice=>"Shopping cart is empty, add some products!") if current_cart.line_items.empty? 
  end
  
  def reset
    if @cart = current_cart
      @cart.destroy
    end
    session[:cart_id] = nil
    session[:shipping_price] = nil
    flash[:notice] = "Your cart is now empty."
    redirect_to products_path
  end
  
  def shipping
    @title = "Shipping"
    @cart = current_cart
  end
  
  def update
    @cart = current_cart
    if @cart.update_attributes(params[:cart]) && @cart.address.present?
      calculate_shipping
      flash[:success] = "Shipping calculated."
      redirect_to current_cart_path
    else
      flash[:error] = "Please insert your shipping address."
      render 'shipping'
    end
  end
  
  
end
