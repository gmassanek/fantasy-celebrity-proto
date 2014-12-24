require 'rails_helper'

RSpec.describe "league_roster_slots/edit", :type => :view do
  before(:each) do
    @league_roster_slot = assign(:league_roster_slot, LeagueRosterSlot.create!(
      :position_id => 1,
      :league_id => 1
    ))
  end

  it "renders the edit league_roster_slot form" do
    render

    assert_select "form[action=?][method=?]", league_roster_slot_path(@league_roster_slot), "post" do

      assert_select "input#league_roster_slot_position_id[name=?]", "league_roster_slot[position_id]"

      assert_select "input#league_roster_slot_league_id[name=?]", "league_roster_slot[league_id]"
    end
  end
end
