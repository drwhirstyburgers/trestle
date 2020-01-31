class UserCourse < ApplicationRecord
  belongs_to :course
  belongs_to :user, dependent: :destroy
end
