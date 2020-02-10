# == Schema Information
#
# Table name: previews
#
#  id         :bigint           not null, primary key
#  blurb      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint           not null
#
# Indexes
#
#  index_previews_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#

class Preview < ApplicationRecord
  belongs_to :course, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_rich_text :pitch
  has_one_attached :image
end
