# app/controllers/dogs_controller.rb
class DogsController < ApplicationController
  def index
    @dogs = Dog.all

    if params[:search].present?
      @dogs = @dogs.where("name LIKE ? OR breed LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    if params[:shelter_id].present?
      @dogs = @dogs.where(shelter_id: params[:shelter_id])
    end

    @dogs = @dogs.page(params[:page]).per(10)
    @shelters = Shelter.all
  end

  def show
    @dog = Dog.find(params[:id])
    @related_dogs = Dog.where.not(id: @dog.id)

    if params[:search].present?
      @related_dogs = @related_dogs.where("name LIKE ? OR breed LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end
  end
end
