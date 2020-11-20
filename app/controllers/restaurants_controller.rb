class RestaurantsController < ApplicationController
  def index
    if params[:query].present?
      @restaurants = Restaurant.search_by_name_and_food_style_and_atmosphere_and_area_and_food_philosophy_and_user_rating(params[:query])
    else
      @restaurants = Restaurant.all
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
