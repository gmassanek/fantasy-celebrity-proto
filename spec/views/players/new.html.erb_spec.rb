require 'rails_helper'

RSpec.describe "players/new", :type => :view do
  before(:each) do
    assign(:player, Player.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :position_id => 1
    ))
  end

  it "renders new player form" do
    render

    assert_select "form[action=?][method=?]", players_path, "post" do

      assert_select "input#player_first_name[name=?]", "player[first_name]"

      assert_select "input#player_last_name[name=?]", "player[last_name]"

      assert_select "input#player_position_id[name=?]", "player[position_id]"
    end
  end
end
