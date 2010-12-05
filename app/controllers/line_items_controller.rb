class LineItemsController < ApplicationController
  
  def create
     @product = Product.find(params[:product_id])
     current_item = current_cart.line_items.where(:product_id => @product).first
     if current_item
       current_item.quantity += 1
       current_item.save!
     else
       @line_item = LineItem.create!( :cart => current_cart, 
                                      :product => @product, 
                                      :quantity => 1, 
                                      :unit_price => @product.price )
     end
     flash[:notice] = "Added #{@product.name} to cart."
     if current_cart.address.present?
       calculate_shipping
     end
     redirect_to current_cart_url
   end
   
   def total_price
     line_items.to_a.sum { |item| item.total_price }
   end
   
  
end
