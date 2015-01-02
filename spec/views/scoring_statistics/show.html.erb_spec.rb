require 'rails_helper'

RSpec.describe "scoring_statistics/show", :type => :view do
  before(:each) do
    @scoring_statistic = assign(:scoring_statistic, ScoringStatistic.create!(
      :description => "MyText",
      :category_id => 1,
      :suggested_points => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/1.5/)
  end
end
