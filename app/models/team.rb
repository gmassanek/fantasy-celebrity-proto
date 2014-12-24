class Team < ActiveRecord::Base
  has_many :roster_slots
  has_many :players, :through => :roster_slots
  belongs_to :league

  def assign_player(player, position)
    if room_for_player_as?(player, position)
      roster_slots.create!(:player => player, :slot => position)
    elsif room_for_player_as?(player, Position.flex)
      roster_slots.create!(:player => player, :slot => Position.flex)
    elsif room_for_player_as?(player, Position.bench)
      roster_slots.create!(:player => player, :slot => Position.bench)
    end
  end

  def available_positions
    @available_positions ||= league.league_roster_slots
  end

  def room_for_player_as?(player, position)
    used_slots = roster_slots.select { |rs| rs.slot == position }.count
    available_slots = available_positions.find { |rs| rs.position == position }.count rescue 0
    available_slots > used_slots
  end

  def starters
    roster_slots.reject { |rs| rs.slot == Position.bench }
  end

  def bench
    roster_slots.select { |rs| rs.slot == Position.bench }
  end
end
