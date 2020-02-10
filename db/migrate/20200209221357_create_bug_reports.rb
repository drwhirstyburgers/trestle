class CreateBugReports < ActiveRecord::Migration[6.0]
  def change
    create_table :bug_reports do |t|
      t.integer :priority
      t.integer :status, default: 0
      t.string :path
      t.string :subject

      t.timestamps
    end
  end
end
