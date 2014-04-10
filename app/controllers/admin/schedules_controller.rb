require 'csv'

class Admin::SchedulesController < AdminController

  def create
    row_count = 0

    import_file = params[:file_upload][:import_file].tempfile

    Game.delete_all

    CSV.foreach(import_file) do |row|
     game = Game.new(
        :home_team => find_team(row[2]),
        :visiting_team => find_team(row[1]),
        :field => find_field(row[3]),
        :starts_at => row[0] )
      game.save

     #starting_at(row[1], row[3])

      row_count+=1
    end
    
    flash[:notice] = "Successfully imported #{row_count} records"
    render :action => "index"
  end

  def find_team(team_name)
    puts "**** #{team_name}"
    x = Team.find_by_short_name(team_name.strip)

    if(x.nil?)
      puts "***** NULL TEAM #{team_name}"
    end

    x
  end
  
  def find_field(field_name)
    x = Field.find_by_name(field_name.strip)
    if(x.nil?)
      puts "***** NULL FIELD #{field_name}"
    end
    x
  end
  
end
