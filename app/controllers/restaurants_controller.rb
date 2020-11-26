class RestaurantsController < ApplicationController
  def index
    if params[:restaurants].present?
      if params[:restaurants][:atmospheres].present?
        @restaurants = Restaurant.tagged_with(params[:restaurants][:atmospheres].last)

      else params[:restaurants][:suitable_fors].present?
        @restaurants = Restaurant.tagged_with(params[:restaurants][:atmospheres].last)
        @restaurants = @restaurants + Restaurant.tagged_with(params[:restaurants][:suitable_fors].last)
      end

    elsif params[:query].present?
      @restaurants = Restaurant.full_search(params[:query])
      @restaurants = @restaurants + Restaurant.tagged_with(params[:query])
    elsif params["search"]

      @filter = params["search"]["food_styles"], params["search"]["atmospheres"], params["search"]["areas"], params["search"]["food_philosophys"], params["search"]["extras"], params["search"]["suitable_fors"]
      @restaurants = @filter.empty? ? Restaurant.all : Restaurant.all.tagged_with((@filter.reject &:blank?), any: true)

    else
      @restaurants = Restaurant.all
    end

    @markers = @restaurants.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude
      }
    end
  end

  def fav
    @restaurant = Restaurant.find(params[:id])
    Favorite.create(user: current_user, restaurant: @restaurant)

    redirect_to restaurant_path(@restaurant)
  end

  def unfav
    @restaurant = Restaurant.find(params[:id])
    @fv = Favorite.find_by(user: current_user, restaurant: @restaurant)
    @fv.destroy

    redirect_to restaurant_path(@restaurant)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @marker = [{
        lat: @restaurant.latitude,
        lng: @restaurant.longitude
      }]
  end
end
