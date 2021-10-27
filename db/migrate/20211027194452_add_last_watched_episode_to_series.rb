class AddLastWatchedEpisodeToSeries < ActiveRecord::Migration[6.1]
  def change
    add_reference :series, :last_watched_episode, null: false, foreign_key: true
  end
end
