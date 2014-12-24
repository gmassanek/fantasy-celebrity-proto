require 'rails_helper'

RSpec.describe "LeagueRosterSlots", :type => :request do
  describe "GET /league_roster_slots" do
    it "works! (now write some real specs)" do
      get league_roster_slots_path
      expect(response).to have_http_status(200)
    end
  end
end
