json.extract! team, :id, :name, :user_id, :description, :deleted_at, :created_at, :updated_at
json.url team_url(team, format: :json)
