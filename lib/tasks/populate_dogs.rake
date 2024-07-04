# lib/tasks/populate_dogs.rake
namespace :populate do
  desc "Populate the database with dogs from DogApiService"
  task dogs: :environment do
    dogs = DogApiService.fetch_random_dogs(50)

    dogs.each do |dog_data|
      name = Faker::CustomData.pet_name
      description = "Meet #{name}! #{Faker::CustomData.pet_description} They are #{rand(1..10)} years old and looking for a forever home."

      Dog.create(
        name: name,
        breed: dog_data[:breed],
        age: rand(1..10),
        description: description,
        photo_url: dog_data[:url],
        shelter: Shelter.all.sample
      )
    end

    puts "Dogs have been successfully populated!"
  end
end

