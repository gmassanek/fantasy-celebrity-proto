require 'rails_helper'

RSpec.describe "league_roster_slots/new", :type => :view do
  before(:each) do
    assign(:league_roster_slot, LeagueRosterSlot.new(
      :position_id => 1,
      :league_id => 1
    ))
  end

  it "renders new league_roster_slot form" do
    render

    assert_select "form[action=?][method=?]", league_roster_slots_path, "post" do

      assert_select "input#league_roster_slot_position_id[name=?]", "league_roster_slot[position_id]"

      assert_select "input#league_roster_slot_league_id[name=?]", "league_roster_slot[league_id]"
    end
  end
end
