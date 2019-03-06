class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :opposing_team
      t.string :oppsoing_game_id
      t.integer :goalie_id
      t.integer :period , default: 1
      t.boolean :home_bool
      t.datetime :date
      t.timestamps
    end
  end
end
