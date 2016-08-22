json.extract! note, :id, :notable_id, :notable_type, :author_id, :title, :body, :created_at, :updated_at
json.url note_url(note, format: :json)