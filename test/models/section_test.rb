# == Schema Information
#
# Table name: sections
#
#  id               :bigint           not null, primary key
#  course_id        :bigint           not null
#  name             :string
#  description      :string
#  time_to_complete :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  order_number     :integer
#

require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
