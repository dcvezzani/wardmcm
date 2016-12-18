require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :provider => "",
      :uid => "Uid",
      :name => "Name",
      :oauth_token => "Oauth Token",
      :oauth_expires_at => "Oauth Expires At",
      :email => "Email",
      :roles_mask => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Uid/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Oauth Token/)
    expect(rendered).to match(/Oauth Expires At/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/2/)
  end
end
