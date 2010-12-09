# == Schema Information
# Schema version: 20101208185720
#
# Table name: payment_notifications
#
#  id             :integer         not null, primary key
#  params         :text
#  status         :string(255)
#  transaction_id :string(255)
#  cart_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class PaymentNotification < ActiveRecord::Base
  
  belongs_to :cart  
  serialize :params  
  after_create :mark_cart_as_purchased  

  private
  
  def mark_cart_as_purchased  
    if status == "Completed"  
      cart.update_attributes(:purchased_at => Time.now)  
    end  
  end
  
end
