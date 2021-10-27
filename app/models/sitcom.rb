class Sitcom < ApplicationRecord
  belongs_to :category
  has_many :rates, as: :rateable
  has_many :episodes, ->{ order(:episode_number) }, dependent: :destroy
  belongs_to :last_watched_episode, optional: true
  validates :title, presence: true
  validates :description, presence: true
  validates :thumbnail_key, presence: true
end
