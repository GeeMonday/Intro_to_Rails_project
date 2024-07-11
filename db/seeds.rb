# db/seeds.rb

# Load custom Faker data
require_relative '../lib/faker/custom_data'

# Create shelters
5.times do
  Shelter.create!(
    name: Faker::CustomData.shelter_name,
    location: Faker::CustomData.shelter_location,
    contact_info: Faker::CustomData.shelter_contact_info,
    website_url: Faker::CustomData.shelter_website_url
  )
end

# Create dogs
50.times do
  Dog.create!(
    name: Faker::CustomData.name,
    breed: Faker::CustomData.breed,
    age: rand(1..10),
    description: Faker::CustomData.dog_description,
    photo_url: Faker::CustomData.dog_photo_url,
    shelter: Shelter.all.sample
  )
end

# Create users
20.times do
  User.create!(
    username: Faker::CustomData.user_username,
    email: Faker::CustomData.user_email,
    password: 'password',
    profile_photo: Faker::CustomData.user_profile_photo
  )
end

# Create favorites
100.times do
  Favorite.create!(
    user: User.all.sample,
    dog: dog.all.sample
  )
end

# Create adoption applications
30.times do
  Application.create!(
    status: ['Pending', 'Approved', 'Rejected'].sample,
    submitted_at: Faker::Date.between(from: 2.years.ago, to: Date.today),
    user: User.order("RANDOM()").first, # Associate with a random user
    dog: Dog.order("RANDOM()").first # Associate with a random dog
  )
end
