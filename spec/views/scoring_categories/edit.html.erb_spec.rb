require 'rails_helper'

RSpec.describe "scoring_categories/edit", :type => :view do
  before(:each) do
    @scoring_category = assign(:scoring_category, ScoringCategory.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit scoring_category form" do
    render

    assert_select "form[action=?][method=?]", scoring_category_path(@scoring_category), "post" do

      assert_select "input#scoring_category_name[name=?]", "scoring_category[name]"
    end
  end
end
