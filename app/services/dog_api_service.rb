# app/services/dog_api_service.rb
class DogApiService
    require 'net/http'
    require 'json'
  
    DOG_API_URL = 'https://dog.ceo/api/breeds/image/random'
  
    def self.fetch_random_dogs(count)
      dogs = []
      count.times do
        response = Net::HTTP.get(URI(DOG_API_URL))
        dog_data = JSON.parse(response)
  
        if dog_data['status'] == 'success'
          breed = extract_breed_from_url(dog_data['message'])
          dogs << { breed: breed, url: dog_data['message'] }
        end
      end
      dogs
    end
  
    private
  
    def self.extract_breed_from_url(url)
      breed = url.split('/')[4] # Extracting the breed from the URL
      breed.split('-').map(&:capitalize).join(' ')
    end
  end
  