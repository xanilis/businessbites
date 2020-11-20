class RemoveColumnFromRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :atmosphere
  end
end
