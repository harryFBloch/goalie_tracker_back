class CreateGoalies < ActiveRecord::Migration[5.2]
  def change
    create_table :goalies do |t|
      t.string :team
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
  end
end
