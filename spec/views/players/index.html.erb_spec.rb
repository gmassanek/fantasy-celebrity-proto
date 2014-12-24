require 'rails_helper'

RSpec.describe "players/index", :type => :view do
  before(:each) do
    assign(:players, [
      Player.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :position_id => 1
      ),
      Player.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :position_id => 1
      )
    ])
  end

  it "renders a list of players" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
