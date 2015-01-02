require 'rails_helper'

RSpec.describe "point_submissions/new", :type => :view do
  before(:each) do
    assign(:point_submission, PointSubmission.new(
      :proof_url => "MyString",
      :scoring_statistic_id => 1,
      :points => 1.5,
      :player_id => 1,
      :comment => "MyText"
    ))
  end

  it "renders new point_submission form" do
    render

    assert_select "form[action=?][method=?]", point_submissions_path, "post" do

      assert_select "input#point_submission_proof_url[name=?]", "point_submission[proof_url]"

      assert_select "input#point_submission_scoring_statistic_id[name=?]", "point_submission[scoring_statistic_id]"

      assert_select "input#point_submission_points[name=?]", "point_submission[points]"

      assert_select "input#point_submission_player_id[name=?]", "point_submission[player_id]"

      assert_select "textarea#point_submission_comment[name=?]", "point_submission[comment]"
    end
  end
end
