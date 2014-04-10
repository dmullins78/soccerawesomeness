require 'spec_helper'

describe Player do

  let(:player) { new_player }

  before(:each) do
    @team = create_team

    @will_not_be_killed_player = create_player(:first_name=>"no", :last_name=>"die", :team=>@team)
    @to_be_killed_player = create_player(:first_name=>"will", :last_name=>"die", :team=>@team)
    
    @current_players = [@will_not_be_killed_player, @to_be_killed_player]

    @new_players = { @will_not_be_killed_player.as_hash => @will_not_be_killed_player };
  end

  it "should load all teams once" do
    Team.should_receive(:find).with(:all).and_return([@team])

    player.do_something(@new_players)
  end

  it "should load all players" do
    Player.should_receive(:find).with(:all).and_return(@current_players)

    player.do_something(@new_players)
  end

  it "should delete players not found in new import" do
    Player.should_receive(:find).with(:all).and_return(@current_players)
    Player.should_receive(:delete).with(@to_be_killed_player.id)


    player.do_something(@new_players)

  end

  it "should add new players in import file" do
    player_x = create_player(:first_name=>"x", :last_name=>"factor", :team=>@team)
    @new_players[player_x.as_hash] = player_x

    Player.should_receive(:find).with(:all).and_return(@current_players)
    Player.should_receive(:where).and_return(true)
    Player.should_receive(:save).with(player_x)


    player.do_something(@new_players)

  end

end
