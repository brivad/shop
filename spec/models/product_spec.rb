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
  
  
  describe "with variants" do
    
    it "should have variants" do
      product = Product.create!(@attr)
      variant_1 = product.variants.create(:name=>"Size", :value=>"S")
      variant_2 = product.variants.create(:name=>"Size", :value=>"M")
      variant_3 = product.variants.create(:name=>"Size", :value=>"L")
      product.should have(3).variants

    end
    
  end

  
end
