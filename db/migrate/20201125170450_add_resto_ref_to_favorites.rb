class AddRestoRefToFavorites < ActiveRecord::Migration[6.0]
  def change
    add_reference :favorites, :restaurant, null: false, foreign_key: true
  end
end
