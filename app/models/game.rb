class Game < ActiveRecord::Base
  belongs_to :visiting_team, :class_name => 'Team'
  belongs_to :home_team, :class_name => 'Team'
  belongs_to :field
  :upload

  def game_label
    "#{home_team.display_name} vs. #{visiting_team.display_name}"
  end 
  
  def starts_at=(date)
    parsed = Timeliness.parse(date, :datetime)
    write_attribute(:starts_at, parsed.to_datetime) if parsed
  end

 def as_json(options = nil) #:nodoc:
     json = super(:only => [:starts_at, :home_team_score, :visiting_team_score, :home_team_id, :visiting_team_id])
     json[:home_team] = home_team.display_name
     json[:visiting_team] = visiting_team.display_name
     json[:field] = field.name
     json
 end 

end
