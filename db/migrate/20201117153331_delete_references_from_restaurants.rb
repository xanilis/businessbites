class DeleteReferencesFromRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_reference :restaurants, :favorites, index: true, foreign_key: true
  end
end
