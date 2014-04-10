class AddLeagueOneToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :short_name, :string
    add_column :teams, :display_name, :string
    add_column :teams, :league_one_id, :string
    remove_column :teams, :name
  end
end
