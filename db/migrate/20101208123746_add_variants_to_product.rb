class AddVariantsToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :variants, :string
  end

  def self.down
    remove_column :products, :variants
  end
end
