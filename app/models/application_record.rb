class Application < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :dog

  # Validations
  validates :user_id, presence: true
  validates :dog_id, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending approved rejected], message: "%{value} is not a valid status" }
  validates :submitted_at, presence: true
end

