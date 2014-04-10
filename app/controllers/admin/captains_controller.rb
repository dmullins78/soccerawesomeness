require 'csv'

class Admin::CaptainsController < AdminController

  def create
    captains = params[:captains][:captains]
    captains.split("\r\n").each{|captainTeam| 
      captainName = captainTeam.split(",")[0]
      teamName = captainTeam.split(",")[1]
      puts "Updating #{captainName} #{teamName}"

      captain = User.find_by_email(captainName)
      if(captain.nil?) 
        captain = User.create! :email => captainName, :password => captainName, :password_confirmation => captainName
      end

      team = Team.find_by_name(teamName)

      captain.teams << team
      captain.save
    }

    flash[:notice] = "Successfully created captains"
    render :action => "index"
  end

end
