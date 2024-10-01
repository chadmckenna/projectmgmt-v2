json.extract! todo, :id, :description, :complete, :todoable_id, :created_at, :updated_at
json.url todo_url(todo, format: :json)
