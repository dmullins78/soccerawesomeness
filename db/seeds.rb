divisions = Division.create!([ {name: 'Upper'}, {name: 'Middle'}, {name: 'Lower'} ])

fields = Field.create!([
                       { name: "Ankeny 19" },
                       { name: "Ankeny 20" },
                       { name: "Cownie 1" },
                       { name: "Cownie 2" },
                       { name: "Cownie 3" },
                       { name: "Cownie 4" },
                       { name: "Cownie 7" }
                      ])

teams = Team.create!([
                     { display_name: 'Ames', division_id: 1},
                    ])


#Game.create!(:home_team_score => 1, :visiting_team_score => 2, :visiting_team => teams.first, :home_team => teams.last, :field => fields.first, :starts_at => Date.parse('19-04-2012'))
#Player.create!(:first_name => "Dan", :last_name => "Mullins", :number => 3, :team_id => teams.first)

user = User.create! :name => 'Dan Mullins', :email => 'dmullins78@gmail.com', :password => 'password', :password_confirmation => 'password'
user.toggle!(:admin)
