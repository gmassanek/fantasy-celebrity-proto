require "rails_helper"

RSpec.describe PlayerTransactionsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/player_transactions").to route_to("player_transactions#index")
    end

    it "routes to #new" do
      expect(:get => "/player_transactions/new").to route_to("player_transactions#new")
    end

    it "routes to #show" do
      expect(:get => "/player_transactions/1").to route_to("player_transactions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/player_transactions/1/edit").to route_to("player_transactions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/player_transactions").to route_to("player_transactions#create")
    end

    it "routes to #update" do
      expect(:put => "/player_transactions/1").to route_to("player_transactions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/player_transactions/1").to route_to("player_transactions#destroy", :id => "1")
    end

  end
end
