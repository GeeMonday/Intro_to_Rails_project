class Dog < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  belongs_to :shelter
  has_many :favorites
  has_many :applications
  has_many :favorited_by_users, through: :favorites, source: :user
end
