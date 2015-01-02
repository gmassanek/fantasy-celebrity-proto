require 'rails_helper'

RSpec.describe "scoring_statistics/index", :type => :view do
  before(:each) do
    assign(:scoring_statistics, [
      ScoringStatistic.create!(
        :description => "MyText",
        :category_id => 1,
        :suggested_points => 1.5
      ),
      ScoringStatistic.create!(
        :description => "MyText",
        :category_id => 1,
        :suggested_points => 1.5
      )
    ])
  end

  it "renders a list of scoring_statistics" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
