class AddTeamToUsers < ActiveRecord::Migration
  def change
    create_table :teams_users, :id => false do |t| 
      t.references :team
      t.references :user
    end

    remove_column :users, :team
  end

  def down
    drop_table :teams_users
  end

end
