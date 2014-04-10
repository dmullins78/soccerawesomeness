class Players < ActiveRecord::Migration
  def up
   create_table :players do |t|
     t.string :first_name
     t.string :last_name
     t.integer :number
     t.integer :team_id
     t.timestamps
   end
  end

  def down
    drop_table :players
  end
end
