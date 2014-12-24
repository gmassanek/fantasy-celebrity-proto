require 'rails_helper'

RSpec.describe "teams/index", :type => :view do
  before(:each) do
    assign(:teams, [
      Team.create!(
        :title => "Title"
      ),
      Team.create!(
        :title => "Title"
      )
    ])
  end

  it "renders a list of teams" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
