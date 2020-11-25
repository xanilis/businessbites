class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites
  has_many :favorited_restaurants, through: :favorites

  has_many :reviews
  has_many :restaurants, through: :favorites


  def favourited?(resto)
    Favorite.find_by(user: self, restaurant: resto).present?
  end

end
