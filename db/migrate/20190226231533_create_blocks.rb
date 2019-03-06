class CreateBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :blocks do |t|
      t.string :pad
      t.integer :period
      t.integer :goalie_id
      t.integer :game_id
      t.timestamps
    end
  end
end
