class CreateDjs < ActiveRecord::Migration
  def change
    create_table :djs do |t|
      t.string :name, null: false
      t.string :description
      t.string :photo_url
      t.timestamps null: false
    end
  end
end
