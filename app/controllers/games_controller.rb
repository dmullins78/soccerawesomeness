class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(params[:game])

    if @game.save
      flash[:notice] = "Game was successfully updated"

      if(current_user.teams.length ==1)
        redirect_to current_user.teams.first
      else
        redirect_to :controller=>'teams', :action => 'index'
      end
    else
      format.html { render :action => "new" }
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])

    if @game.update_attributes(params[:game])
      flash[:notice] = "Game was successfully updated"

      if(current_user.teams.length ==1)
        redirect_to current_user.teams.first
      else
        redirect_to :controller=>'teams', :action => 'index'
      end
    else
      format.html { render :action => "edit" }
    end
  end

end
