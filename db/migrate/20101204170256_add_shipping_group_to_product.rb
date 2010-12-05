class AddShippingGroupToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :shipping_group, :integer
  end

  def self.down
    remove_column :products, :shipping_group
  end
end
