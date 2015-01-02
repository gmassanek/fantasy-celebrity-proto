require 'rails_helper'

RSpec.describe "scoring_statistics/new", :type => :view do
  before(:each) do
    assign(:scoring_statistic, ScoringStatistic.new(
      :description => "MyText",
      :category_id => 1,
      :suggested_points => 1.5
    ))
  end

  it "renders new scoring_statistic form" do
    render

    assert_select "form[action=?][method=?]", scoring_statistics_path, "post" do

      assert_select "textarea#scoring_statistic_description[name=?]", "scoring_statistic[description]"

      assert_select "input#scoring_statistic_category_id[name=?]", "scoring_statistic[category_id]"

      assert_select "input#scoring_statistic_suggested_points[name=?]", "scoring_statistic[suggested_points]"
    end
  end
end
