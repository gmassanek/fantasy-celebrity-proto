require 'rails_helper'

RSpec.describe "league_roster_slots/show", :type => :view do
  before(:each) do
    @league_roster_slot = assign(:league_roster_slot, LeagueRosterSlot.create!(
      :position_id => 1,
      :league_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
