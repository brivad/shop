class AddInvoiceUidToCart < ActiveRecord::Migration
  def self.up
    add_column :carts, :invoice_uid, :integer
  end

  def self.down
    remove_column :carts, :invoice_uid
  end
end
