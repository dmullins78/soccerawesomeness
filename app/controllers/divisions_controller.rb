class DivisionsController < ApplicationController

  respond_to :json, :html
  def index
    @divisions = Division.all

    if params[:standings]
      @divisions.each { |d| d.sort_by_standings }
    else
      @divisions.each { |d| d.sort_by_name }
    end

    respond_with(@divisions)
  end

end
