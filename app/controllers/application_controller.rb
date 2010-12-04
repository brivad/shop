class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  def current_cart
    session[:cart_id] ||= Cart.create!.id
    @current_cart ||= Cart.find_or_create_by_id(session[:cart_id])
  end
  
end
