class AddStatsToGoalies < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :cons_saves, :integer, default: 0
    add_column :games, :left_crease, :integer, default: 0
    add_column :games, :pass, :integer, default: 0
    add_column :games, :waved_icing, :integer, default: 0
  end
end
