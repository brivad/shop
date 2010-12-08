class AddVariantToLineItems < ActiveRecord::Migration
  def self.up
    add_column :line_items, :product_variant, :string
  end

  def self.down
    remove_column :line_items, :product_variant
  end
end
