# lib/faker/custom_data.rb
module Faker
    class CustomData
      class << self
        def pet_name
          %w[Bella Luna Max Lucy Charlie Daisy].sample
        end
  
        def pet_breed
          %w[Beagle Poodle Labrador Husky Bulldog Shepherd].sample
        end
  
        def pet_description
          ["Loves playing fetch", "Very friendly and loves people", "Quiet and calm", "Active and playful", "Good with children", "House trained"].sample
        end
  
        def pet_photo_url
          %w[
            "https://example.com/photo1.jpg"
            "https://example.com/photo2.jpg"
            "https://example.com/photo3.jpg"
          ].sample
        end
  
        def shelter_name
          ["Happy Tails Shelter", "Furry Friends Rescue", "Safe Haven Shelter", "Paws and Claws Rescue", "Animal Care Center"].sample
        end
  
        def shelter_location
          Faker::Address.full_address
        end
  
        def shelter_contact_info
          Faker::PhoneNumber.phone_number
        end
  
        def shelter_website_url
          Faker::Internet.url
        end
  
        def user_username
          Faker::Internet.username
        end
  
        def user_email
          Faker::Internet.email
        end
  
        def user_profile_photo
          Faker::Avatar.image
        end
  
        def application_status
          %w[Pending Approved Rejected].sample
        end
  
        def application_submitted_at
          Faker::Date.between(from: 1.year.ago, to: Date.today)
        end
      end
    end
  end
  