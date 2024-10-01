json.extract! project, :id, :name, :description, :client_id, :created_at, :updated_at
json.url project_url(project, format: :json)
json.description project.description.to_s
