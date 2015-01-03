require 'rails_helper'

RSpec.describe "player_transactions/new", :type => :view do
  before(:each) do
    assign(:player_transaction, PlayerTransaction.new(
      :player_id => 1,
      :action => "MyString",
      :team_id => 1
    ))
  end

  it "renders new player_transaction form" do
    render

    assert_select "form[action=?][method=?]", player_transactions_path, "post" do

      assert_select "input#player_transaction_player_id[name=?]", "player_transaction[player_id]"

      assert_select "input#player_transaction_action[name=?]", "player_transaction[action]"

      assert_select "input#player_transaction_team_id[name=?]", "player_transaction[team_id]"
    end
  end
end
