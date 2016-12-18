require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :provider => "",
      :uid => "MyString",
      :name => "MyString",
      :oauth_token => "MyString",
      :oauth_expires_at => "MyString",
      :email => "MyString",
      :roles_mask => 1
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_provider[name=?]", "user[provider]"

      assert_select "input#user_uid[name=?]", "user[uid]"

      assert_select "input#user_name[name=?]", "user[name]"

      assert_select "input#user_oauth_token[name=?]", "user[oauth_token]"

      assert_select "input#user_oauth_expires_at[name=?]", "user[oauth_expires_at]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_roles_mask[name=?]", "user[roles_mask]"
    end
  end
end
