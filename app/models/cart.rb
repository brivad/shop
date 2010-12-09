# == Schema Information
# Schema version: 20101209173502
#
# Table name: carts
#
#  id           :integer         not null, primary key
#  purchased_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#  address      :text
#  country      :string(255)
#  invoice_uid  :integer
#

class Cart < ActiveRecord::Base
  
  has_many :line_items
  has_many :products, :through => :line_items
  
  after_create :generate_invoice_uid
  
  def total_price
    # convert to array so it doesn't try to do sum on database directly
    line_items.to_a.sum(&:full_price)
  end
  
  def paypal_url(return_url, shipping_price, notify_url)  
    values = {  
      :charset => "utf-8",
      :business => "seller_1290453557_biz@gmail.com",  #TODO: move this and other in configuration file ouside git or example one
      :cmd => "_cart",  
      :upload => 1,  
      :return => return_url,
      :rm => 2, 
      :cbt => "Return to Shop",
      :invoice => invoice_uid,                                   #it should send an id different from the cart_id...
      :currency_code => "EUR",
      :handling_cart => shipping_price,
      :notify_url => notify_url
    }  

    line_items.each_with_index do |item, index|  
      values.merge!({  
        "amount_#{index + 1}" => item.unit_price,  
        "item_name_#{index + 1}" => item.product.name + (" (#{item.product.variant_name}: #{item.product_variant})" if item.product.variant_name).to_s,  

       # "item_number_#{index + 1}" => item.product.id,  
        "quantity_#{index + 1}" => item.quantity  
      })  
    end  
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.map { |k,v| "#{k}=#{v}"  }.join("&")  
  end
  
  private
  
  def generate_invoice_uid
    uid = (Time.now.to_i.to_s + id.to_s).to_i
    update_attributes! :invoice_uid => uid
  end
  
  
end
