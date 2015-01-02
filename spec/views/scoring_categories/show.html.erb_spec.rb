require 'rails_helper'

RSpec.describe "scoring_categories/show", :type => :view do
  before(:each) do
    @scoring_category = assign(:scoring_category, ScoringCategory.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
