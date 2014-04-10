class TeamTakeTwo < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :division_id
      t.timestamps
    end
  end

  def self.down
    drop table :teams
  end
end
