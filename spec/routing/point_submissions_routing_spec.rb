require "rails_helper"

RSpec.describe PointSubmissionsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/point_submissions").to route_to("point_submissions#index")
    end

    it "routes to #new" do
      expect(:get => "/point_submissions/new").to route_to("point_submissions#new")
    end

    it "routes to #show" do
      expect(:get => "/point_submissions/1").to route_to("point_submissions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/point_submissions/1/edit").to route_to("point_submissions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/point_submissions").to route_to("point_submissions#create")
    end

    it "routes to #update" do
      expect(:put => "/point_submissions/1").to route_to("point_submissions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/point_submissions/1").to route_to("point_submissions#destroy", :id => "1")
    end

  end
end
