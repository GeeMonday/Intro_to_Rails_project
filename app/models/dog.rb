class Dog < ApplicationRecord
  belongs_to :shelter
  has_many :applications
  has_many :favorites
  has_many :favorited_by_users, through: :favorites, source: :user

  validates :name, :breed, :age, :description, :photo_url, presence: true
end
