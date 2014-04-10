module GamesHelper

  def opponent(game, team)
    if(game.home_team == team) 
      game.visiting_team.display_name
    else
      game.home_team.display_name
    end
  end

  def start_time(game)
    starts = game.starts_at
    starts.strftime('%m/%d/%Y %I:%M')
  end

  def home_winner(game)
    game_score_label("W", game) {|x,y| x > y } || game_score_label("T", game) {|x,y| x == y }
  end
  
  def visit_winner(game)
    game_score_label("W", game) {|x,y| x < y }
  end

  def game_score_label(label, game, &oper)
    if(game.home_team_score)
      if(oper.call(game.home_team_score, game.visiting_team_score))
        "(#{label} #{game.home_team_score}-#{game.visiting_team_score})"
      end
    end 
  end

  def game_label(game)
    if(game.home_team)
      "#{game.home_team.display_name} vs. #{game.visiting_team.display_name}"
    else
      "New Game"
    end
  end

  def game_date(game)
    game.starts_at.strftime('%m/%d')
  end

  def starts_at_label(game)
    if(game.starts_at)
      game.starts_at.strftime('%m/%d/%Y %I:%M')
    else
      Time.new.strftime('%m/%d/%Y %I:%M')
    end
  end
end
