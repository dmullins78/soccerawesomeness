Lordrupert::Application.routes.draw do
  devise_for :users

  root :to => 'teams#index' 

  resources :divisions, :teams, :games, :home

  namespace :admin do
    resources :rosters
    resources :schedules
    resources :captains
    resources :team_import
    resources :teams
    resources :fields
  end 

  #match 'user_root' => 'captains#index'

end

