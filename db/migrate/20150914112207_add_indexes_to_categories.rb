class AddIndexesToCategories < ActiveRecord::Migration
  def change
    add_index(:categories, :slug, unique: true)
    change_column_null(:categories, :slug, false)
    change_column_null(:categories, :title, false)
  end
end
