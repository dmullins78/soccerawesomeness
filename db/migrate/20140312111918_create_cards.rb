class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :player_id
      t.integer :game_id
      t.string :color
      t.timestamps
    end
  end
end
