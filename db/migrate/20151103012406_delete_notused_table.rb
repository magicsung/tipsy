class DeleteNotusedTable < ActiveRecord::Migration
  def change
    drop_table :participates
    drop_table :meetups
    drop_table :meetup_messages
  end
end
