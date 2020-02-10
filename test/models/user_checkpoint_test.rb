# == Schema Information
#
# Table name: user_checkpoints
#
#  id            :bigint           not null, primary key
#  complete      :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  checkpoint_id :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_user_checkpoints_on_checkpoint_id  (checkpoint_id)
#  index_user_checkpoints_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (checkpoint_id => checkpoints.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class UserCheckpointTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
