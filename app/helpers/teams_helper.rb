module TeamsHelper
  def available_positions(team, player)
    team.league.available_positions.select do |position|
      position == player.position || position == Position.flex || position == Position.bench
    end.uniq
  end
end
