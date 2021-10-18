json.extract! subscriber, :id, :user_id, :ahoy_visit_id, :email, :confirmation_token, :confirmed_at, :confirmation_sent_at, :created_at, :updated_at
json.url subscriber_url(subscriber, format: :json)
