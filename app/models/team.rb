class Team < ActiveRecord::Base
  before_validation :get_captain
  
  attr_accessible :league_one_id, :short_name, :display_name, :division_id, :users_attributes

  belongs_to :division
  has_and_belongs_to_many :users
  has_many :players, :order => "last_name"
  has_many :home_games, :class_name => 'Game', :foreign_key => 'home_team_id'
  has_many :away_games, :class_name => 'Game', :foreign_key => 'visiting_team_id'
  accepts_nested_attributes_for :users, reject_if: proc { |attributes| attributes['email'].blank? }

  def get_captain
    self.users = self.users.collect do |user|
      User.find_or_create_by_email(user.email)
    end
  end

  def games
    [home_games, away_games].flatten.sort { |x,y| x.starts_at <=> y.starts_at }
  end

  def points
    ties + (wins * 3)
  end

  def wins
    sum_matching_games { |x,y| x > y } 
  end

  def losses
    sum_matching_games { |x,y| x < y } 
  end

  def ties
    sum_matching_games { |x,y| x == y } 
  end

  def sum_matching_games(&oper)
    home = home_games.select { |g| 
      oper.call(g.home_team_score, g.visiting_team_score) if g.home_team_score
    }.length

    away = away_games.select { |g| 
      oper.call(g.visiting_team_score, g.home_team_score) if g.visiting_team_score
    }.length

    home + away
  end

  def as_json(options = {})
    super(:only => [:id, :display_name], :methods => [:games, :players])
  end 

end
