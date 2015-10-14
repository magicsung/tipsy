class AddUploadToEvent < ActiveRecord::Migration

  def up
    add_attachment :events, :edm
  end

  def down
    remove_attachment :events, :edm
  end

end
