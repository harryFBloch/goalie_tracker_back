class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :hole
      t.string :time
      t.integer :period
      t.integer :goalie_id
      t.integer :game_id
      t.timestamps
    end
  end
end
