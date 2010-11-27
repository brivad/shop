# == Schema Information
# Schema version: 20101127172557
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
#  variant_id :integer
#

class LineItem < ActiveRecord::Base
  
  belongs_to :cart
  belongs_to :product
  belongs_to :variant

  def full_price
    unit_price * quantity
  end

end
