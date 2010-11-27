# == Schema Information
# Schema version: 20101127172557
#
# Table name: variants
#
#  id         :integer         not null, primary key
#  product_id :integer
#  name       :string(255)
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Variant < ActiveRecord::Base
  belongs_to :product
end
