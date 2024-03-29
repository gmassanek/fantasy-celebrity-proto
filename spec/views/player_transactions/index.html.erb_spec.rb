require 'rails_helper'

RSpec.describe "player_transactions/index", :type => :view do
  before(:each) do
    assign(:player_transactions, [
      PlayerTransaction.create!(
        :player_id => 1,
        :action => "Action",
        :team_id => 2
      ),
      PlayerTransaction.create!(
        :player_id => 1,
        :action => "Action",
        :team_id => 2
      )
    ])
  end

  it "renders a list of player_transactions" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Action".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
