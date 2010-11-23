require 'spec_helper'

describe ProductsController do
  render_views  #needed for the have_selector method below

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'new'
      response.should have_selector("title", :content => "Add")
    end
  end
end

