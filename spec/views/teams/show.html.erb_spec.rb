require 'rails_helper'

RSpec.describe "teams/show", :type => :view do
  before(:each) do
    @team = assign(:team, Team.create!(
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
