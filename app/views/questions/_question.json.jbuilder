json.extract! question, :id, :quiz_id, :question, :order_number, :video_url, :created_at, :updated_at
json.url question_url(question, format: :json)
