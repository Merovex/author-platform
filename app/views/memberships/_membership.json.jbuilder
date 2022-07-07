json.extract! membership, :id, :user_id, :membership_id, :membership_type, :deleted_at, :created_at, :updated_at
json.url membership_url(membership, format: :json)
