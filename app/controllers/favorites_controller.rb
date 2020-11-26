class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
