json.array!(@point_submissions) do |point_submission|
  json.extract! point_submission, :id, :proof_url, :scoring_statistic_id, :points, :player_id, :comment
  json.url point_submission_url(point_submission, format: :json)
end
