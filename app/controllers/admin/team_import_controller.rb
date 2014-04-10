require 'csv'

class Admin::TeamImportController < AdminController

  def create
    row_count = 0
    import_file = params[:file_upload][:import_file].tempfile

  #attr_accessible :league_one_id, :short_name, :display_name
    CSV.foreach(import_file) do |row|
      team_id = row[0]

      team = Team.find_by_league_one_id team_id
      if team.blank?
        team = Team.new(:league_one_id => team_id)
      end

      team.update_attributes(:short_name => row[2], :display_name => row[3])
    end

    flash[:notice] = "Successfully imported #{row_count} records"
    render :action => "index"
  end

end
