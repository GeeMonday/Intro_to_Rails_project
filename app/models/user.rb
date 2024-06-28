class User < ApplicationRecord
    has_secure_password
    has_many :applications
    has_many :favorites
    has_many :favorite_pets, through: :favorites, source: :pet
  end
