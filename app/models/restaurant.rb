class Restaurant < ApplicationRecord
  has_many :reviews

  include PgSearch::Model
  pg_search_scope :search_by_name_and_food_style_and_atmosphere_and_area_and_food_philosophy_and_user_rating,
    against: [ :name, :food_style, :atmosphere, :area, :food_philosophy, :user_rating ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
