json.extract! todo, :id, :created_by_id, :assigned_to_id, :todolist_id, :summary, :created_at, :updated_at
json.url todo_url(todo, format: :json)
