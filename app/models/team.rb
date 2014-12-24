class Team < ActiveRecord::Base
  has_many :roster_slots
  has_many :players, :through => :roster_slots
end
