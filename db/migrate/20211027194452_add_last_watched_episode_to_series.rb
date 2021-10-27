class AddLastWatchedEpisodeToSeries < ActiveRecord::Migration[6.1]
  def change
    add_reference :sitcoms, :last_watched_episode, null: false, foreign_key: {to_table: :movies}
  end
end
