# db/seeds.rb
User.destroy_all
Pet.destroy_all
Shelter.destroy_all
Application.destroy_all
Favorite.destroy_all

# Create users
10.times do
  User.create(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: 'password',
    profile_photo: Faker::Avatar.image
  )
end

# Create shelters
5.times do
  Shelter.create(
    name: Faker::Company.name,
    location: Faker::Address.city,
    contact_info: Faker::PhoneNumber.phone_number,
    website_url: Faker::Internet.url
  )
end

# Create pets
50.times do
  Pet.create(
    name: Faker::Creature::Dog.name,
    breed: Faker::Creature::Dog.breed,
    age: rand(1..10),
    description: Faker::Lorem.sentence,
    photo_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['pets']),
    shelter: Shelter.all.sample
  )
end

# Create applications
20.times do
  Application.create(
    user: User.all.sample,
    pet: Pet.all.sample,
    status: ['pending', 'approved', 'rejected'].sample,
    submitted_at: Faker::Date.backward(days: 30)
  )
end

# Create favorites
30.times do
  Favorite.create(
    user: User.all.sample,
    pet: Pet.all.sample
  )
end
