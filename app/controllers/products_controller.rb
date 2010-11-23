class ProductsController < ApplicationController
  def new
    @title = "Add a Product"
  end
  
  def show
    @product = Product.find(params[:id])
  end

end
