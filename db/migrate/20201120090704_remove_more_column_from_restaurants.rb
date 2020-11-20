class RemoveMoreColumnFromRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :extras
  end
end
