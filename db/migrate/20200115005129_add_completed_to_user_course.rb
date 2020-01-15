class AddCompletedToUserCourse < ActiveRecord::Migration[6.0]
  def change
    add_column :user_courses, :completed, :boolean, default: false
  end
end
