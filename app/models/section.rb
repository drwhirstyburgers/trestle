# == Schema Information
#
# Table name: sections
#
#  id               :bigint           not null, primary key
#  description      :string
#  name             :string
#  order_number     :integer
#  time_to_complete :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  course_id        :bigint           not null
#
# Indexes
#
#  index_sections_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#

class Section < ApplicationRecord
  has_many :checkpoints, dependent: :destroy
  has_many :quizzes, dependent: :destroy
  belongs_to :course, dependent: :destroy

  has_many :user_sections
  has_many :users, through: :user_sections
end
