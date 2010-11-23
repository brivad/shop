# == Schema Information
# Schema version: 20101123134159
#
# Table name: line_items
#
#  id         :integer         not null, primary key
#  unit_price :decimal(, )
#  product_id :integer
#  cart_id    :integer
#  quantity   :integer
#  created_at :datetime
#  updated_at :datetime
#

class LineItem < ActiveRecord::Base
  
  belongs_to :cart
  belongs_to :product

  def full_price
    unit_price * quantity
  end

end
