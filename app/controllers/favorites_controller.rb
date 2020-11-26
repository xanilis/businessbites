class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites

    @markers = @favorites.map do |fav|
      {
        lat: fav.restaurant.latitude,
        lng: fav.restaurant.longitude
      }
  end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
