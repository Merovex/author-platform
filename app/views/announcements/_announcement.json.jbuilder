json.extract! announcement, :id, :title, :summary, :published_at, :announceable_id, :announceable_type, :created_at,
              :updated_at
json.url announcement_url(announcement, format: :json)
