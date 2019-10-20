json.extract! checkpoint, :id, :name, :content, :references, :video_url, :created_at, :updated_at
json.url checkpoint_url(checkpoint, format: :json)
