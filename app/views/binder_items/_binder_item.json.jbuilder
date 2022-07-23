json.extract! binder_item, :id, :name, :ancestry, :synopsis, :project_id, :created_at, :updated_at
json.url binder_item_url(binder_item, format: :json)
