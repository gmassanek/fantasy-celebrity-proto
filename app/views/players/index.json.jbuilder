json.array!(@players) do |player|
  json.extract! player, :id, :first_name, :last_name, :position_id
  json.url player_url(player, format: :json)
end
