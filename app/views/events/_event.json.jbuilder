json.extract! event, :id, :profile_id, :date_time, :location, :details, :comments, :created_at, :updated_at
json.url event_url(event, format: :json)
