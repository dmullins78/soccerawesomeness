class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :starts_at
      t.integer :visiting_team_id
      t.integer :home_team_id
      t.integer :field_id
      t.integer :home_team_score
      t.integer :visiting_team_score

      t.timestamps
    end
  end

  def self.down
    drop table :games
  end
end
