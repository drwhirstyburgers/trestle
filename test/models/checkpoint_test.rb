# == Schema Information
#
# Table name: checkpoints
#
#  id               :bigint           not null, primary key
#  description      :text
#  order_number     :integer
#  time_to_complete :integer
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  section_id       :bigint           not null
#
# Indexes
#
#  index_checkpoints_on_section_id  (section_id)
#
# Foreign Keys
#
#  fk_rails_...  (section_id => sections.id)
#

require 'test_helper'

class CheckpointTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
