class DeleteTicketsTable < ActiveRecord::Migration
  def change
    drop_table :tickets
  end
end
