class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :image_url
      t.string :phone
      t.integer :rating
      t.string :description
      t.string :hours
      t.string :location_address
      t.string :location_city
      t.float :coordinate_lat
      t.float :coordinate_lon

      t.timestamps null: false
    end
  end
end
