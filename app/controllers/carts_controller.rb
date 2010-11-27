class CartsController < ApplicationController
  
  def show
    @cart = current_cart
  end
  
  def reset
    @cart = current_cart
    @cart.destroy
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
      
      
      calculate_shipping(@cart.country)
      
      flash[:success] = "Shipping calculated."
      redirect_to current_cart_path
    else
      render 'shipping'
    end
  end
  
  
  private
  
  def calculate_shipping(country)
    session[:shipping_price] = "10" #TODO:real calculate
    
  end

end
