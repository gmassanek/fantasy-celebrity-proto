require 'rails_helper'

RSpec.describe "ScoringStatistics", :type => :request do
  describe "GET /scoring_statistics" do
    it "works! (now write some real specs)" do
      get scoring_statistics_path
      expect(response).to have_http_status(200)
    end
  end
end
