class Admin::TeamsController < AdminController

  def index
    @teams = Team.all(:order => :display_name)
  end

  def new
    @team = Team.new
    @team.users.build
  end

  def create
    @team = Team.new(params[:team])

    if @team.save
      flash[:notice] = "Game was successfully updated"
      redirect_to admin_teams_url
    else
      Rails.logger.info(@team.errors.messages.inspect)
      
      render "edit"
    end
  end

  def edit
    @team = Team.find(params[:id])
    unless @team.users.any? 
      @team.users.build
    end
  end

  def destroy
    Team.find(params[:id]).destroy
    redirect_to admin_teams_url
  end

  def update
    @team = Team.find(params[:id])

    if @team.update_attributes(params[:team])
      flash[:notice] = "Team was successfully updated"

      redirect_to admin_teams_url
    else
      Rails.logger.info(@team.errors.messages.inspect)
      
      render "edit"
    end
  end

end
