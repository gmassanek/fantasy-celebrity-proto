require 'waiver_wire'

class Team < ActiveRecord::Base
  has_many :roster_slots
  has_many :players, :through => :roster_slots
  has_many :player_transactions
  belongs_to :league

  validate :valid_roster

  def roster_slot_for_player(player)
    self.roster_slot_for_player_id(player.id)
  end

  def roster_slot_for_player_id(player_id)
    self.roster_slots.find_or_initialize_by(:player_id => player_id)
  end

  def update_positions(roster_slot_params)
    roster_slot_params.each do |_, attrs|
      roster_slot = roster_slots.find { |rs| rs.player_id == attrs[:player_id].to_i }
      roster_slot.slot_id = attrs[:slot_id].to_i
    end

    if valid?
      roster_slot_params.each do |_, attrs|
        WaiverWire.assign(self, attrs[:player_id].to_i, attrs[:slot_id].to_i)
      end
    end
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

  def points
    players.with_point_submissions.inject(0){ |sum, ps| sum + ps.approved_points }
  end

  def self.by_score
    all.sort_by { |t| -1 * t.points }
  end
end
