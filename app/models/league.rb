class League < ActiveRecord::Base
  has_many :teams
  has_many :league_roster_slots
end
