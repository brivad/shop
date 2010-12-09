class PagesController < ApplicationController
  protect_from_forgery :except => [:thanks]  
  def home
    @title = "Home"
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  
  def thanks
    flash[:success]="Order received, thanks for buying"
    redirect_to root_path
  end

end
