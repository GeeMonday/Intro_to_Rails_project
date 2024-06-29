# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
    @featured_pets = Pet.limit(5).order("RANDOM()")
    @shelters = Shelter.limit(3)
    @users = User.limit(3)
  end
end
