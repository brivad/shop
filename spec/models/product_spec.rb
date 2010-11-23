require 'spec_helper'

describe Product do
  
  before(:each) do
    @attr = { :name => "IDC Man", :price => "10.00" }
  end

  it "should create a new instance given valid attributes" do
    Product.create!(@attr)
  end

  it "should require a name" do
    no_name_product = Product.new(@attr.merge(:name => ""))
    no_name_product.should_not be_valid
  end
  
  it "should require a price" do
    no_price_product = Product.new(@attr.merge(:price => ""))
    no_price_product.should_not be_valid
  end
  
end
