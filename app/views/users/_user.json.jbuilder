json.extract! user, :id, :provider, :uid, :name, :oauth_token, :oauth_expires_at, :email, :roles_mask, :created_at, :updated_at
json.url user_url(user, format: :json)