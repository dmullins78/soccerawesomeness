class Cards < ActiveRecord::Base
  #attr_accessible :player_id, :game_id, :color
  belongs_to :game, :class_name => 'Game'
  belongs_to :player, :class_name => 'Player'

end
