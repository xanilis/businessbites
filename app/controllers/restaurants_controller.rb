class RestaurantsController < ApplicationController
  def index
    if params[:query].present?
      @restaurants = Restaurant.full_search(params[:query])
      @restaurants = @restaurants + Restaurant.tagged_with(params[:query])
    elsif params["search"]
      @filter = params["search"]["food_styles"].concat(params["search"]["atmospheres"]).flatten.reject(&:blank?)
      @restaurants = @filter.empty? ? Restaurant.all : Restaurant.all.tagged_with(@filter, any: true)
    else
      @restaurants = Restaurant.all
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
