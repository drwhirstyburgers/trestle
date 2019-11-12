# == Schema Information
#
# Table name: checkpoints
#
#  id               :bigint           not null, primary key
#  section_id       :bigint           not null
#  title            :string
#  description      :text
#  order_number     :integer
#  time_to_complete :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class CheckpointTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
