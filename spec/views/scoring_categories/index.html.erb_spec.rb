require 'rails_helper'

RSpec.describe "scoring_categories/index", :type => :view do
  before(:each) do
    assign(:scoring_categories, [
      ScoringCategory.create!(
        :name => "Name"
      ),
      ScoringCategory.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of scoring_categories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
