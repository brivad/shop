# == Schema Information
# Schema version: 20101208123746
#
# Table name: products
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  description    :text
#  price          :decimal(, )
#  created_at     :datetime
#  updated_at     :datetime
#  shipping_group :integer
#  variants       :string(255)
#

class Product < ActiveRecord::Base
  
  validates :name, :presence => true
  validates :price, :presence => true
  
  has_many :line_items
  
  serialize :variants
  
  def variant_name
    variants.first[0] unless variants.nil?
  end
  
  #TODO: advanced validations
   
end
