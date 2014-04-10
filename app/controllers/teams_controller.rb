class TeamsController < ApplicationController

  before_filter :authenticate_user!, :except => :show

  def index
    if current_user.admin?
      @teams = Team.all(:order => :display_name)
    elsif current_user.teams.length > 1 
      @teams = current_user.teams
    else
      redirect_to current_user.teams.first
    end
  end

  respond_to :json, :html
  def show
    @team = Team.find(params[:id])
    
    respond_with(@team)
   end

end
