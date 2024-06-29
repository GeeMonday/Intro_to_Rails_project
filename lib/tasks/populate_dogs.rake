# lib/tasks/populate_dogs.rake
namespace :populate do
    desc "Populate the database with dogs from DogAPI"
    task dogs: :environment do
      dogs = DogAPIService.fetch_random_dogs(50)
  
      dogs.each do |dog_data|
        Dog.create(
          name: Faker::Creature::Dog.name,
          breed: dog_data[:breed],
          age: rand(1..10),
          description: "Meet #{Faker::Creature::Dog.name}! This #{dog_data[:breed]} is a wonderful companion, known for their #{Faker::Creature::Dog.sound} and loving nature. They are #{rand(1..10)} years old and looking for a forever home.",
          photo_url: dog_data[:url],
          shelter: Shelter.all.sample
        )
      end
  
      puts "Dogs have been successfully populated!"
    end
  end
  