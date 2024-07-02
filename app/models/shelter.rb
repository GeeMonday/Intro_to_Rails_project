class Shelter < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 100 }
  validates :location, presence: true
  
  has_many :dogs
end
