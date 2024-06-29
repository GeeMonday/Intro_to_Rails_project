# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
    @dogs = Dog.limit(10)
    @shelters = Shelter.all
    @users = User.all
  end
end
