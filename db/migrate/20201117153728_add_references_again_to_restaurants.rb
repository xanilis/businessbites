class AddReferencesAgainToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_reference :restaurants, :favorite, null: false, foreign_key: true
  end
end
