class AddPhotoToStores < ActiveRecord::Migration

  def up
    add_attachment :stores, :photo
  end

  def down
    remove_attachment :stores, :photo
  end

end
