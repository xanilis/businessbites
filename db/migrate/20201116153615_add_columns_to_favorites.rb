class AddColumnsToFavorites < ActiveRecord::Migration[6.0]
  def change
    add_column :favorites, :title, :string
    add_column :favorites, :status, :boolean, default: false
  end
end
