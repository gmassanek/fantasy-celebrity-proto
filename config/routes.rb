Rails.application.routes.draw do
  resources :player_transactions

  resources :point_submissions

  resources :scoring_statistics

  resources :scoring_categories

  resources :league_roster_slots

  resources :leagues

  resources :positions

  resources :players

  resources :teams

  root 'teams#index'
end
