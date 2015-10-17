class CreateParticipates < ActiveRecord::Migration
  def change
    create_table :participates do |t|
      t.integer :user_id, null: false
      t.integer :meetup_id, null: false

      t.timestamps null: false
    end
  end
end
