class Rate < ApplicationRecord
  belongs_to :rateable, polymorphic: true
  belongs_to :user
  validates :rating, presence: true, numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: 5}
  validates :description, presence: true, lenght: {minimum: 50}
  validates :user_id, uniqueness: {scope: [:rateable_type, :rateable_id], message: "You already rated it !"}
end
