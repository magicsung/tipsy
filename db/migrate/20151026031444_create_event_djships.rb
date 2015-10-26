class CreateEventDjships < ActiveRecord::Migration
  def change
    create_table :event_djships do |t|
      t.integer :event_id, null: false
      t.integer :djs_id, null: false

      t.timestamps null: false
    end
    add_index :event_djships, :event_id
    add_index :event_djships, :djs_id
  end
end
