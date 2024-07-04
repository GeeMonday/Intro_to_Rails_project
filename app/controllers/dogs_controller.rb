# app/controllers/dogs_controller.rb
class DogsController < ApplicationController
  def index
    if params[:search].present?
      @dogs = Dog.where("name LIKE ? OR breed LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").page(params[:page]).per(10)
    else
      @dogs = Dog.page(params[:page]).per(10)
    end
    @shelters = Shelter.all  # Optionally, if needed for hierarchical search
  end

  def show
    @dog = Dog.find(params[:id])
    @related_dogs = Dog.where.not(id: @dog.id)

    if params[:search].present?
      @related_dogs = @related_dogs.where("name LIKE ? OR breed LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end
  end
end
