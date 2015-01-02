require 'rails_helper'

RSpec.describe "point_submissions/index", :type => :view do
  before(:each) do
    assign(:point_submissions, [
      PointSubmission.create!(
        :proof_url => "Proof Url",
        :scoring_statistic_id => 1,
        :points => 1.5,
        :player_id => 2,
        :comment => "MyText"
      ),
      PointSubmission.create!(
        :proof_url => "Proof Url",
        :scoring_statistic_id => 1,
        :points => 1.5,
        :player_id => 2,
        :comment => "MyText"
      )
    ])
  end

  it "renders a list of point_submissions" do
    render
    assert_select "tr>td", :text => "Proof Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
