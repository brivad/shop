# == Schema Information
# Schema version: 20101124171549
#
# Table name: carts
#
#  id           :integer         not null, primary key
#  purchased_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#  address      :text
#  country      :string(255)
#

class Cart < ActiveRecord::Base
  
  has_many :line_items
  
  def total_price
    # convert to array so it doesn't try to do sum on database directly
    line_items.to_a.sum(&:full_price)
  end
  
  
  def paypal_url(return_url,shipping_price)  
    values = {  
      :business => "seller_1290453557_biz@gmail.com",  
      :cmd => "_cart",  
      :upload => 1,  
      :return => return_url,  
      :invoice => id,
      :currency_code => "EUR",
      :handling_cart => shipping_price
    }  

    line_items.each_with_index do |item, index|  
      values.merge!({  
        "amount_#{index + 1}" => item.unit_price,  
        "item_name_#{index + 1}" => item.product.name,  
        "item_number_#{index + 1}" => item.product.id,  
        "quantity_#{index + 1}" => item.quantity  
      })  
    end  
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.map { |k,v| "#{k}=#{v}"  }.join("&")  
  end
  
end
