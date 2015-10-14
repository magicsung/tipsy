class AddPhotoToDj < ActiveRecord::Migration

  def up
    add_attachment :djs, :photo
  end

  def down
    remove_attachment :djs, :photo
  end

end
