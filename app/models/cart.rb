# == Schema Information
# Schema version: 20101123134159
#
# Table name: carts
#
#  id           :integer         not null, primary key
#  purchased_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

class Cart < ActiveRecord::Base
  
  has_many :line_items
  
  def total_price
    # convert to array so it doesn't try to do sum on database directly
    line_items.to_a.sum(&:full_price)
  end
  
end
