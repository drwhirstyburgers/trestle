# == Schema Information
#
# Table name: bug_reports
#
#  id         :bigint           not null, primary key
#  path       :string
#  priority   :integer
#  status     :integer          default("submitted")
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BugReport < ApplicationRecord
    has_rich_text :body

    enum priority: [:low, :medium, :high]
    enum status: [:submitted, :in_progress, :resolved]
end
