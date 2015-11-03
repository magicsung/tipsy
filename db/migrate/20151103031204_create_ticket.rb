class CreateTicket < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.string :qrcode, null: false
      t.datetime :due_time, null: false

      t.timestamps null: false
    end
  end
end
