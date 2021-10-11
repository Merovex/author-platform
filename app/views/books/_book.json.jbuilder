json.extract! book, :id, :title, :slug, :is_featured, :released_on, :synopsis, :created_at, :updated_at
json.url book_url(book, format: :json)
