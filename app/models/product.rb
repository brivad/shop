# == Schema Information
# Schema version: 20101122205709
#
# Table name: products
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  decription :string(255)
#  price      :decimal(, )
#  created_at :datetime
#  updated_at :datetime
#

class Product < ActiveRecord::Base
  
  validates :name, :presence => true
  validates :price, :presence => true
  
  #TODO: advanced validations
   
end
