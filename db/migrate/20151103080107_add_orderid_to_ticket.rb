class AddOrderidToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :order_id, :integer, null: false
    add_index :tickets, :order_id
  end
end
