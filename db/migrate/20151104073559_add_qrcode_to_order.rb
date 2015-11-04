class AddQrcodeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :qrcode, :string
    add_index :orders, :qrcode
  end
end
