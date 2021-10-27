class Movie < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :sitcom, optional: true
  has_many :rates, as: :rateable
  has_many :players, dependent: :destroy
  has_one :watched_sitcom, foreign_key: "last_watched_episode", dependent: :nullify
  validates :title, presence: true
  validates :thumbnail_key, presence: true
  validates :video_key, presence: true
  validates :episode_number, presence: true, uniqueness: {scope: :sitcom_id}, if: -> {sitcom.present?}
  validates :category, presence: true, if: ->{ sitcom.nil? }
  validates :highlight_episode

  private

    def highlight_episode
      if self.sitcom.present? && self.highlighted == true
        errors.ass(:highlight_episode, "Episodes sitcoms can not be highlighted")
      end
    end
end
