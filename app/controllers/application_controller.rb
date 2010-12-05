class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  def current_cart
    session[:cart_id] ||= Cart.create!.id
    @current_cart ||= Cart.find_or_create_by_id(session[:cart_id])
  end
  
  def calculate_shipping
    sgc = shipping_group_count
    stc =  sgc.values.sum             #shipping total items count
    if sgc[:g1] == 1 && stc == 1      #in total 1 product in group 1
      session[:shipping_price] = "5"
    elsif sgc[:g1] == 2 && stc == 2   #in tatal 2 products in group 1
      session[:shipping_price] = "6"
    else
      session[:shipping_price] = "8"
    end
    
  end
  
  
  def shipping_group_count
    h={:g1=>0,
       :g2=>0,
       :g3=>0}
    current_cart.line_items.each do |item|
      group = "g" + item.product.shipping_group.to_s
      qty = item.quantity
      h[group.to_sym] += qty
    end
    h
  end
  
  
end
