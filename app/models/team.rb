class Team < ActiveRecord::Base
  has_many :roster_slots
  has_many :players, :through => :roster_slots
  belongs_to :league

  validate :valid_roster

  def assign_player(player, position)
    if room_for_player_as?(player, position)
      roster_slots.create!(:player => player, :slot => position)
    elsif room_for_player_as?(player, Position.flex)
      roster_slots.create!(:player => player, :slot => Position.flex)
    elsif room_for_player_as?(player, Position.bench)
      roster_slots.create!(:player => player, :slot => Position.bench)
    end
  end

  def update_positions(roster_slot_params)
    roster_slot_params.each do |_, attrs|
      roster_slot = roster_slots.find { |rs| rs.player_id == attrs[:player_id].to_i }
      roster_slot.slot_id = attrs[:slot_id].to_i
    end

    valid? && roster_slots.all?(&:save)
  end

  def valid_roster
    available_slots = available_positions.inject({}) do |avail, pos|
      avail[pos.position.name] = pos.count
      avail
    end

    roster_slots.each do |rs|
      available_slots[rs.slot.name] -= 1
    end

    available_slots.select { |_, cnt| cnt < 0 }.each do |ps, cnt|
      errors[:roster_slots] << "Too many #{ps.pluralize}. You have #{cnt * -1} more than are allowed."
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
