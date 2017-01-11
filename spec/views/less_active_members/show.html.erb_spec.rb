require 'rails_helper'

RSpec.describe "less_active_members/show", type: :view do
  before(:each) do
    @less_active_member = assign(:less_active_member, LessActiveMember.create!(
      :surname => "Surname",
      :given_name => "Given Name",
      :current_address => "MyText",
      :new_address => "MyText",
      :new_phone => "New Phone",
      :reference => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Surname/)
    expect(rendered).to match(/Given Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/New Phone/)
    expect(rendered).to match(/MyText/)
  end
end
