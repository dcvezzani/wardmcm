require 'rails_helper'

RSpec.describe "less_active_members/index", type: :view do
  before(:each) do
    assign(:less_active_members, [
      LessActiveMember.create!(
        :surname => "Surname",
        :given_name => "Given Name",
        :current_address => "MyText",
        :new_address => "MyText",
        :new_phone => "New Phone",
        :reference => "MyText"
      ),
      LessActiveMember.create!(
        :surname => "Surname",
        :given_name => "Given Name",
        :current_address => "MyText",
        :new_address => "MyText",
        :new_phone => "New Phone",
        :reference => "MyText"
      )
    ])
  end

  it "renders a list of less_active_members" do
    render
    assert_select "tr>td", :text => "Surname".to_s, :count => 2
    assert_select "tr>td", :text => "Given Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "New Phone".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
