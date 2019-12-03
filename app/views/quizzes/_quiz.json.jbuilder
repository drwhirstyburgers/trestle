json.extract! quiz, :id, :title, :description, :order_number, :time_to_complete, :section_id, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
