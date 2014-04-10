class Division < ActiveRecord::Base
  has_many :teams

  def sort_by_standings
    teams.sort_by!{ |a| [-a.points, a.display_name] } 
  end

  def sort_by_name
    teams.sort_by!{ |a| a.display_name } 
  end

  def as_json(options = nil) #:nodoc:
    json = super(:only => [:id, :name])

    x = Array.new 
    teams.each { |team|
      x << {:name => team.display_name, :id => team.id, :points => team.points, :wins => team.wins, :losses => team.losses, :ties => team.ties}
    }

    json[:teams] = x

    json
  end 

end
