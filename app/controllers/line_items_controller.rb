class LineItemsController < ApplicationController
  
  def create
     session[:shipping_price] = nil #TODO: manage shipping price update on adding products if shipping were already calculated
     @product = Product.find(params[:line_item][:product_id])
     @variant = Variant.find(params[:line_item][:variant_id])
     @line_item = LineItem.create!( :cart => current_cart, 
                                    :product => @product, 
                                    :variant => @variant,
                                    :quantity => 1, 
                                    :unit_price => @product.price
                                  )
     flash[:notice] = "Added #{@product.name} to cart."
     redirect_to current_cart_path
   end
  
end
