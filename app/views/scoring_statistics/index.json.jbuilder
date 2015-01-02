json.array!(@scoring_statistics) do |scoring_statistic|
  json.extract! scoring_statistic, :id, :description, :scoring_category_id, :suggested_points
  json.url scoring_statistic_url(scoring_statistic, format: :json)
end
