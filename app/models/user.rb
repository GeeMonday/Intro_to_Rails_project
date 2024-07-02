class User < ApplicationRecord
  # Assuming you renamed it to `new_username`
  validates :new_username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :bio, presence: true, length: { maximum: 500 }


  
  # If you're using `has_secure_password` with Devise
  has_secure_password validations: false
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :applications
  has_many :favorites
  has_many :favorite_pets, through: :favorites, source: :dog
end

