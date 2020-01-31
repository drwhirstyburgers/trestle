class UserCourse < ApplicationRecord
  belongs_to :course
  belongs_to :user, dependent: :destroy

  def deactivate
    self.active_course = false
    self.save
  end
  
end
