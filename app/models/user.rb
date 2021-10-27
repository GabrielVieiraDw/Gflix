class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, 
         :rememberable, :validatable
  has_many :rates
  has_many :favorites
  has_many :players
  validates :name, presence: true
end
