class AddColumnsToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :name, :string
    add_column :restaurants, :address, :string
    add_column :restaurants, :description, :text
    add_column :restaurants, :photo, :string
    add_column :restaurants, :food_style, :string
    add_column :restaurants, :atmosphere, :string
    add_column :restaurants, :area, :string
    add_column :restaurants, :food_philosophy, :string
    add_column :restaurants, :extras, :string
    add_column :restaurants, :user_rating, :integer
  end
end
