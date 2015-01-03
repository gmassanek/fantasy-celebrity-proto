json.array!(@player_transactions) do |player_transaction|
  json.extract! player_transaction, :id, :player_id, :action, :team_id
  json.url player_transaction_url(player_transaction, format: :json)
end
