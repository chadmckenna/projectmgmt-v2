json.extract! client, :id, :name, :notes, :created_at, :updated_at
json.url client_url(client, format: :json)
json.notes client.notes.to_s
