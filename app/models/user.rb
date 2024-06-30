class User < ApplicationRecord
   # Assuming you renamed it to `new_username`
   validates :new_username, presence: true, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_secure_password
    has_many :applications
    has_many :favorites
    has_many :favorite_pets, through: :favorites, source: :pet
  end
