# == Schema Information
# Schema version: 20101123134159
#
# Table name: products
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  price       :decimal(, )
#  created_at  :datetime
#  updated_at  :datetime
#

class Product < ActiveRecord::Base
  
  validates :name, :presence => true
  validates :price, :presence => true
  
  has_many :line_items
  
  #TODO: advanced validations
   
end
