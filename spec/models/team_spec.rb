require 'spec_helper'

describe Team do

  let(:team) { Team.new(:name => "Recipe") }

  before(:each) do
    team.home_games << Game.new(:home_team_score => 1, :visiting_team_score => 0)
    team.home_games << Game.new(:home_team_score => 0, :visiting_team_score => 1)
    team.home_games << Game.new(:home_team_score => 1, :visiting_team_score => 1)
    team.away_games << Game.new(:home_team_score => 0, :visiting_team_score => 1)
    team.away_games << Game.new(:home_team_score => 1, :visiting_team_score => 0)
    team.away_games << Game.new(:home_team_score => 1, :visiting_team_score => 1)
    team.away_games << Game.new
  end

  it "should count home and away wins" do
    team.wins.should eq(2)
  end

  it "should count home and away losses" do
    team.losses.should eq(2)
  end

  it "should count home and away ties" do
    team.ties.should eq(2)
  end

  it "should get 3 points for a win and 1 for a tie" do
    team.points.should eq(8)
  end

end
