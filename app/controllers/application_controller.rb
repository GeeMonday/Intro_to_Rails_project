# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
    before_action :set_shelters
  
    private
  
    def set_shelters
      @shelters = Shelter.all
    end
  end
  