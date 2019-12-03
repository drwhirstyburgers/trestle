json.extract! quiz, :id, :section_id, :title, :order_number, :time_to_complete, :description, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
