class AddLinkToRestaurant < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :link, :string
  end
end
