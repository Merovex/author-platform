json.extract! author, :id, :book_id, :user_id, :summary, :created_at, :updated_at
json.url author_url(author, format: :json)
