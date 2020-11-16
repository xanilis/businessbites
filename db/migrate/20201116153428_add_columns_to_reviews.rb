class AddColumnsToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :description, :text
    add_column :reviews, :title, :string
    add_column :reviews, :rating, :integer
  end
end
