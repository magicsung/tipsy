class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :djs_id

      t.timestamps null: false
    end
    add_index :playlists, :djs_id
  end
end
