class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :status
      t.text :description
      t.string :contact
      t.string :phone
      t.string :city
      t.string :address
      t.date :start_date
      t.time :start_time
      t.date :due_date
      t.time :due_time

      t.timestamps null: false
    end
  end
end
