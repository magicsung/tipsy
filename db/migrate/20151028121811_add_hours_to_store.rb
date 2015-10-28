class AddHoursToStore < ActiveRecord::Migration
  def change

    remove_column :stores, :hours
    add_column :stores, :hours_monday, :string
    add_column :stores, :hours_tuesday, :string
    add_column :stores, :hours_wensday, :string
    add_column :stores, :hours_thursday, :string
    add_column :stores, :hours_friday, :string
    add_column :stores, :hours_saturday, :string
    add_column :stores, :hours_sunday, :string

  end
end
