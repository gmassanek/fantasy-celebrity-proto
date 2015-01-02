ucC
require 'rails_helper'

RSpec.describe "point_submissions/show", :type => :view do
  before(:each) do
    @point_submission = assign(:point_submission, PointSubmission.create!(
      :proof_url => "Proof Url",
      :scoring_statistic_id => 1,
      :points => 1.5,
      :player_id => 2,
      :comment => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Proof Url/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
  end
end
