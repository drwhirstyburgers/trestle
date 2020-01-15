class AddActiveCourseToUserCourse < ActiveRecord::Migration[6.0]
  def change
    add_column :user_courses, :active_course, :boolean, default: false
  end
end
