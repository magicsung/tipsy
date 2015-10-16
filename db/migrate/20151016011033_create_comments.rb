class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.string :user_id, null: false
      t.integer :rating, default: 0

      t.timestamps null: false
    end
    
    add_index :comments, :user_id
  end
end
