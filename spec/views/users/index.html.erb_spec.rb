require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :provider => "",
        :uid => "Uid",
        :name => "Name",
        :oauth_token => "Oauth Token",
        :oauth_expires_at => "Oauth Expires At",
        :email => "Email",
        :roles_mask => 2
      ),
      User.create!(
        :provider => "",
        :uid => "Uid",
        :name => "Name",
        :oauth_token => "Oauth Token",
        :oauth_expires_at => "Oauth Expires At",
        :email => "Email",
        :roles_mask => 2
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Oauth Token".to_s, :count => 2
    assert_select "tr>td", :text => "Oauth Expires At".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
