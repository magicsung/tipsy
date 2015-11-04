class AddColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :price, :string
    add_column :events, :popular, :boolean, default: false 
    add_column :events, :store_id, :integer, null: false
    add_index :events, :store_id
  end
end
