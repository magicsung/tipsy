class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.references :user, index: true, foreign_key: true
      t.references :store, index: true, foreign_key: true
      t.references :vip, index: true, foreign_key: true
      t.integer :price, null: false
      t.integer :quantity, null: false, default: 1
      t.string :payment_method, null: false, default: 'new order'

      t.timestamps null: false
    end
  end
end
