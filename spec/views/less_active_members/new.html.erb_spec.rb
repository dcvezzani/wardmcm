require 'rails_helper'

RSpec.describe "less_active_members/new", type: :view do
  before(:each) do
    assign(:less_active_member, LessActiveMember.new(
      :surname => "MyString",
      :given_name => "MyString",
      :current_address => "MyText",
      :new_address => "MyText",
      :new_phone => "MyString",
      :reference => "MyText"
    ))
  end

  it "renders new less_active_member form" do
    render

    assert_select "form[action=?][method=?]", less_active_members_path, "post" do

      assert_select "input#less_active_member_surname[name=?]", "less_active_member[surname]"

      assert_select "input#less_active_member_given_name[name=?]", "less_active_member[given_name]"

      assert_select "textarea#less_active_member_current_address[name=?]", "less_active_member[current_address]"

      assert_select "textarea#less_active_member_new_address[name=?]", "less_active_member[new_address]"

      assert_select "input#less_active_member_new_phone[name=?]", "less_active_member[new_phone]"

      assert_select "textarea#less_active_member_reference[name=?]", "less_active_member[reference]"
    end
  end
end
