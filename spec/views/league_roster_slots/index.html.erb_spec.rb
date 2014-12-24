require 'rails_helper'

RSpec.describe "league_roster_slots/index", :type => :view do
  before(:each) do
    assign(:league_roster_slots, [
      LeagueRosterSlot.create!(
        :position_id => 1,
        :league_id => 2
      ),
      LeagueRosterSlot.create!(
        :position_id => 1,
        :league_id => 2
      )
    ])
  end

  it "renders a list of league_roster_slots" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
