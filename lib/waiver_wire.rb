module WaiverWire
  def self.add_player(team, player_id)
    player = Player.find(player_id)
    roster_slot = team.roster_slot_for_player(player)

    if team.room_for_player_as?(player, player.position)
      roster_slot.slot = player.position
    elsif team.room_for_player_as?(player, Position.flex)
      roster_slot.slot = Position.flex
    elsif team.room_for_player_as?(player, Position.bench)
      roster_slot.slot = Position.bench
    end

    roster_slot.save
  end

  def self.assign(team, player_id, slot_id)
    roster_slot = team.roster_slot_for_player_id(player_id)
    roster_slot.update_attributes(:slot_id => slot_id)
  end
end
