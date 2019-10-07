json.extract! course, :id, :title, :description, :price, :duration, :accreditation, :created_at, :updated_at
json.url course_url(course, format: :json)
