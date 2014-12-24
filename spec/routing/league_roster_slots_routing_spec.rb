require "rails_helper"

RSpec.describe LeagueRosterSlotsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/league_roster_slots").to route_to("league_roster_slots#index")
    end

    it "routes to #new" do
      expect(:get => "/league_roster_slots/new").to route_to("league_roster_slots#new")
    end

    it "routes to #show" do
      expect(:get => "/league_roster_slots/1").to route_to("league_roster_slots#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/league_roster_slots/1/edit").to route_to("league_roster_slots#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/league_roster_slots").to route_to("league_roster_slots#create")
    end

    it "routes to #update" do
      expect(:put => "/league_roster_slots/1").to route_to("league_roster_slots#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/league_roster_slots/1").to route_to("league_roster_slots#destroy", :id => "1")
    end

  end
end
