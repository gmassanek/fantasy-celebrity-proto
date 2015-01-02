require 'rails_helper'

RSpec.describe "PointSubmissions", :type => :request do
  describe "GET /point_submissions" do
    it "works! (now write some real specs)" do
      get point_submissions_path
      expect(response).to have_http_status(200)
    end
  end
end
