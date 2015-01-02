require 'rails_helper'

RSpec.describe "ScoringCategories", :type => :request do
  describe "GET /scoring_categories" do
    it "works! (now write some real specs)" do
      get scoring_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
