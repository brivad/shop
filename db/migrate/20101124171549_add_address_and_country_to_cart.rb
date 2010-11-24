class AddAddressAndCountryToCart < ActiveRecord::Migration
  def self.up
    add_column :carts, :address, :text
    add_column :carts, :country, :string
  end

  def self.down
    remove_column :carts, :country
    remove_column :carts, :address
  end
end
