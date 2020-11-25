# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :user
  has_many :restaurants
end
