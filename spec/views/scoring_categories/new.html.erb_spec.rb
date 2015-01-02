require 'rails_helper'

RSpec.describe "scoring_categories/new", :type => :view do
  before(:each) do
    assign(:scoring_category, ScoringCategory.new(
      :name => "MyString"
    ))
  end

  it "renders new scoring_category form" do
    render

    assert_select "form[action=?][method=?]", scoring_categories_path, "post" do

      assert_select "input#scoring_category_name[name=?]", "scoring_category[name]"
    end
  end
end
