require 'rails_helper'

RSpec.describe "players/show", :type => :view do
  before(:each) do
    @player = assign(:player, Player.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :position_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/1/)
  end
end
