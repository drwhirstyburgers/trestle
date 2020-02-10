# == Schema Information
#
# Table name: bug_reports
#
#  id         :bigint           not null, primary key
#  body       :text
#  path       :string
#  priority   :integer
#  status     :integer
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BugReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
