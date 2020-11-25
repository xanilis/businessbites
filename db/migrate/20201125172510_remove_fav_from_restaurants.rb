class RemoveFavFromRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_reference :restaurants, :favorite, null: false, foreign_key: true
  end
end
