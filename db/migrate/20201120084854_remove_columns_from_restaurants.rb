class RemoveColumnsFromRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :food_style
  end
end
