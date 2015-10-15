class AddColumnToStore < ActiveRecord::Migration
  def change

    change_column :stores, :coordinate_lat, :string
    change_column :stores, :coordinate_lon, :string
    add_column :stores, :yelp_id, :string
    add_column :stores, :yelp_image, :string

  end
end
