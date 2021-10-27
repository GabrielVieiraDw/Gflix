class Category < ApplicationRecord
  has_many :sitcoms
  has_many :movies
  validates :name, presence: true, uniqueness: true
end
