require 'spec_helper'

describe CartsController do
  
  describe "get 'reset'" do



      before(:each) do
        @cart = Factory(:cart)
      end

      it "should create a line item" do
        lambda do
          post :create, :product_id => @product
        end.should change(LineItem, :count).by(1)
      end

      it "should redirect to the current cart show page" do
        post :create, :product_id => @product
        response.should redirect_to(current_cart_url)
      end    
    end

  
end
