class AddCategoryToStore < ActiveRecord::Migration
  def change
    add_column :stores, :category_id, :integer
  end
end
