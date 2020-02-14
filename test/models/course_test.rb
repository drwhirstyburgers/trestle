# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  accreditation :string
#  active        :boolean          default(FALSE)
#  archive       :boolean
#  description   :string
#  duration      :integer
#  price         :float
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
