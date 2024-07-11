class Shelter < ApplicationRecord
  has_many :dogs

  validates :name, presence: true
  validates :location, presence: true
  validates :contact_info, presence: true
  validates :website_url, presence: true
end
