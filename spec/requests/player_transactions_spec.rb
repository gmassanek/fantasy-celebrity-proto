require 'rails_helper'

RSpec.describe "PlayerTransactions", :type => :request do
  describe "GET /player_transactions" do
    it "works! (now write some real specs)" do
      get player_transactions_path
      expect(response).to have_http_status(200)
    end
  end
end
