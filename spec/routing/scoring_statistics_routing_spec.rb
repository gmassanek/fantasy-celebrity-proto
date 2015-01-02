require "rails_helper"

RSpec.describe ScoringStatisticsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/scoring_statistics").to route_to("scoring_statistics#index")
    end

    it "routes to #new" do
      expect(:get => "/scoring_statistics/new").to route_to("scoring_statistics#new")
    end

    it "routes to #show" do
      expect(:get => "/scoring_statistics/1").to route_to("scoring_statistics#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/scoring_statistics/1/edit").to route_to("scoring_statistics#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/scoring_statistics").to route_to("scoring_statistics#create")
    end

    it "routes to #update" do
      expect(:put => "/scoring_statistics/1").to route_to("scoring_statistics#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/scoring_statistics/1").to route_to("scoring_statistics#destroy", :id => "1")
    end

  end
end
