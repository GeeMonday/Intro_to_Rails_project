# app/services/dog_api_service.rb
require 'httparty'

class DogAPIService
  include HTTParty
  base_uri 'https://dog.ceo/api'

  def self.fetch_random_dogs(number_of_dogs = 50)
    response = get("/breeds/image/random/#{number_of_dogs}")
    response.parsed_response["message"].map do |url|
      breed = url.split("/")[4].gsub('-', ' ').titleize
      { url: url, breed: breed }
    end
  end
end
