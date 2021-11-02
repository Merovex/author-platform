json.extract! subscription, :id, :user_id, :source_type, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
