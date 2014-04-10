Fixjour do
  define_builder(Player) do |klass, overrides|
    klass.new(:first_name => 'Joe', :last_name => 'Blow', :team => new_team)
  end
end


