json.extract! series, :id, :title, :slug, :synopsis, :created_at, :updated_at
json.url series_url(series, format: :json)
