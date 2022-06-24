json.extract! todolist, :id, :name, :todolistable_id, :todolistable_type, :user_id, :created_at, :updated_at
json.url todolist_url(todolist, format: :json)
