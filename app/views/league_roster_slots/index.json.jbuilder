json.array!(@league_roster_slots) do |league_roster_slot|
  json.extract! league_roster_slot, :id, :position_id, :league_id
  json.url league_roster_slot_url(league_roster_slot, format: :json)
end
