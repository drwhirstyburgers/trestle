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

require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
