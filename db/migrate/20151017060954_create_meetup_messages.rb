class CreateMeetupMessages < ActiveRecord::Migration
  def change
    create_table :meetup_messages do |t|
      t.integer :user_id, null: false
      t.integer :meetup_id, null: false
      t.string :content, null: false

      t.timestamps null: false
    end
  end
end
