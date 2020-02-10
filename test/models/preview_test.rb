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

require 'test_helper'

class PreviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
