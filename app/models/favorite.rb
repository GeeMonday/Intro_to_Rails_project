class Favorite < Applications
  belongs_to :user
  belongs_to :dog

  validates :user_id, uniqueness: { scope: :dog_id, message: "You have already favorited this dog" }
end
