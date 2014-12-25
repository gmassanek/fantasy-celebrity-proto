class League < ActiveRecord::Base
  has_many :teams
  has_many :league_roster_slots

  def available_positions
    return @positions if @positions
    @positions = []
    league_roster_slots.each do |roster_slot|
      roster_slot.count.times { @positions << roster_slot.position }
    end
    @positions
  end
end
