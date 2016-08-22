json.extract! contact_info, :id, :user_id, :type, :name, :value, :created_at, :updated_at
json.url contact_info_url(contact_info, format: :json)