class AddIndexesToResources < ActiveRecord::Migration
  def change
    add_index(:resources, :url, unique: true)
    change_column_null(:resources, :title, false)
    change_column_null(:resources, :url, false)
  end
end
