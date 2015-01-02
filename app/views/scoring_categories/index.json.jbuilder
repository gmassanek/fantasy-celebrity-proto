json.array!(@scoring_categories) do |scoring_category|
  json.extract! scoring_category, :id, :name
  json.url scoring_category_url(scoring_category, format: :json)
end
