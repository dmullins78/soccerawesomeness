require 'csv'

class Admin::RostersController < AdminController

  def create
    row_count = 0

    import_file = params[:file_upload][:import_file].tempfile

    Player.delete_all
    CSV.foreach(import_file) do |row|
      team_name = row[104]
      player = Player.new(
        :first_name => row[6],
        :last_name => row[5],
        :team => Team.find_by_short_name(team_name))
      player.save

      row_count+=1
    end
    
    flash[:notice] = "Successfully imported #{row_count} records"
    render :action => "index"
  end
  
end
