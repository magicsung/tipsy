class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :description
      t.string :coordinate_lat
      t.string :coordinate_lon
      t.integer :limit
      t.integer :join_count
      t.date :date_start
      t.time :time_start

      t.timestamps null: false
    end
    add_index :meetups, :user_id
  end
end
