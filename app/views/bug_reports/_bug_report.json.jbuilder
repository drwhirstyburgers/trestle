json.extract! bug_report, :id, :priority, :status, :path, :body, :subject, :created_at, :updated_at
json.url bug_report_url(bug_report, format: :json)
