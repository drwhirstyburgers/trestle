json.extract! checkpoint_content, :id, :type, :text, :video_url, :order, :checkpoint_id, :created_at, :updated_at
json.url checkpoint_content_url(checkpoint_content, format: :json)
