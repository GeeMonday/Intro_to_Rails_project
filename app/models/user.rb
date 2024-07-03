class User < ApplicationRecord
  has_one_attached :profile_photo

  # Validations
  validates :new_username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :bio, presence: true, length: { maximum: 500 }
  validate :correct_profile_photo_type
  validate :correct_profile_photo_size

  # Devise modules
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Associations
  has_many :applications
  has_many :favorites
  has_many :favorite_dogs, through: :favorites, source: :dog

  private

  def correct_profile_photo_type
    if profile_photo.attached? && !profile_photo.content_type.in?(%w(image/jpeg image/png))
      errors.add(:profile_photo, 'must be a JPEG or PNG')
    end
  end

  def correct_profile_photo_size
    if profile_photo.attached? && profile_photo.byte_size > 5.megabytes
      errors.add(:profile_photo, 'size needs to be less than 5MB')
    end
  end
end
