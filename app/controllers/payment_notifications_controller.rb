class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]  

  def create
    
    PaymentNotification.create!(:params => params, 
                                :cart_id => search_cart_id(params[:invoice]),
                                :status => params[:payment_status], 
                                :transaction_id => params[:txn_id] )  
    render :nothing => true  
  end
  
  def search_cart_id(invoice)
    Cart.find_by_invoice_uid(invoice.to_s).id
  end
  
end
