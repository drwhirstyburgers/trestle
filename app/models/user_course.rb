# == Schema Information
#
# Table name: user_courses
#
#  id            :bigint           not null, primary key
#  active        :boolean
#  active_course :boolean          default(FALSE)
#  completed     :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  course_id     :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_user_courses_on_course_id  (course_id)
#  index_user_courses_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (user_id => users.id)
#

class UserCourse < ApplicationRecord
  belongs_to :course
  belongs_to :user, dependent: :destroy

  def deactivate
    self.active_course = false
    self.save
  end
  
end
