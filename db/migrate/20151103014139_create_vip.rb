class CreateVip < ActiveRecord::Migration
  def change
    create_table :vips do |t|

    t.string :name, null: false
    t.decimal :price, null: false
    t.integer :store_id, null: false
    t.integer :stock, null: false
    t.datetime :datetime, null: false

    t.timestamps null: false
    end
  end
end
