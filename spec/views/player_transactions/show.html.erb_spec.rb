require 'rails_helper'

RSpec.describe "player_transactions/show", :type => :view do
  before(:each) do
    @player_transaction = assign(:player_transaction, PlayerTransaction.create!(
      :player_id => 1,
      :action => "Action",
      :team_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Action/)
    expect(rendered).to match(/2/)
  end
end
