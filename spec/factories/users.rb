FactoryGirl.define do
  factory :user do
    provider ""
    uid "MyString"
    name "MyString"
    oauth_token "MyString"
    oauth_expires_at "MyString"
    email "MyString"
    roles_mask 1
  end
end
