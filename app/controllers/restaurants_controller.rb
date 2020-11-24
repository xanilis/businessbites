class RestaurantsController < ApplicationController
  def index
    if params[:restaurants].present?
      if params[:restaurants][:atmospheres].present?
        @restaurants = Restaurant.tagged_with(params[:restaurants][:atmospheres].last)


    elsif params[:restaurants][:suitable_fors].present?
      @restaurants = Restaurant.tagged_with(params[:restaurants][:atmospheres].last)
      @restaurants = @restaurants + Restaurant.tagged_with(params[:restaurants][:suitable_fors].last)
    end

    elsif params[:query].present?
      @restaurants = Restaurant.full_search(params[:query])
      @restaurants = @restaurants + Restaurant.tagged_with(params[:query])

    elsif params["search"]
      @filter = params["search"]["food_styles"].concat(params["search"]["atmospheres"]).concat(params["search"]["areas"]).concat(params["search"]["food_philosophys"]).concat(params["search"]["extras"]).concat(params["search"]["suitable_fors"]).flatten.reject(&:blank?)
      @restaurants = @filter.empty? ? Restaurant.all : Restaurant.all.tagged_with(@filter, any: true)

    else
      @restaurants = Restaurant.all
    end
  end

  # def suitable
  #   if params[:restaurants][:suitable_fors].present?
  #      @restaurants = Restaurant.tagged_with(params[:restaurants][:suitable_fors].last)
  #   else
  #     @restaurants = Restaurant.all
  #   end
  # end

  # def atmosphere
  #   if params[:restaurants][:atmospheres].present?
  #     @restaurants = Restaurant.tagged_with(params[:restaurants][:atmospheres].last)
  #   else
  #     @restaurants = Restaurant.all
  #   end
  # end


  def show
    @restaurant = Restaurant.find(params[:id])

    @marker = @restaurant.geocoded.map do
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end
end
