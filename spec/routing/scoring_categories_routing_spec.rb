require "rails_helper"

RSpec.describe ScoringCategoriesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/scoring_categories").to route_to("scoring_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/scoring_categories/new").to route_to("scoring_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/scoring_categories/1").to route_to("scoring_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/scoring_categories/1/edit").to route_to("scoring_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/scoring_categories").to route_to("scoring_categories#create")
    end

    it "routes to #update" do
      expect(:put => "/scoring_categories/1").to route_to("scoring_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/scoring_categories/1").to route_to("scoring_categories#destroy", :id => "1")
    end

  end
end
