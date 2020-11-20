class RemoveAnotherColumnFromRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :food_philosophy
  end
end
