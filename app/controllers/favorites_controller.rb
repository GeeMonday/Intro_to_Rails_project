class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = Favorite.all
  end

  def create
    dog = Dog.find(params[:dog_id])
    current_user.favorite_dogs << dog
    redirect_to dog_path(dog), notice: "Dog added to favorites!"
  end

  def destroy
    dog = Dog.find(params[:dog_id])
    current_user.favorite_dogs.delete(dog)
    redirect_to dog_path(dog), notice: "Dog removed from favorites!"
  end
end
