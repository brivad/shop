class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    @title = @product.name
  end
  
  def index
    @products = Product.all
    @title = "All Products"
  end
  
end
