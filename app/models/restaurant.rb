class Restaurant < ApplicationRecord
  has_many :reviews

  include PgSearch::Model
  pg_search_scope :search_by_name_and_food_style_and_atmosphere_and_area_and_food_philosophy_and_user_rating,
    against: [ :name, :food_style, :atmosphere, :area, :food_philosophy, :user_rating ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  acts_as_taggable_on :food_styles
  acts_as_taggable_on :atmospheres
  acts_as_taggable_on :areas
  acts_as_taggable_on :food_philosophys
  acts_as_taggable_on :extras

  $food_styles = ["Japanese","Fusion","Latin","Portuguese","Spanish","French","Italian"]
  $atmospheres = ["Calm","Formal","Casual","Quiet","Upscale","luxurious","exclusive","romantic"]
  $areas = ["Chiado","Bairro Alto","Alfama","Cascais","Oeiras","Carcavelos","Belém","Baixa","Rossio","Alcântara","Príncipe Real","Parque das Nações"]
  $food_philosophys = ["vegan","vegetarian","seafood","traditional","modern","fusion","local","experimential","haute-cuisine"]
  $extras = ["extensive wine list","amuse-bouche","live music"]
end
