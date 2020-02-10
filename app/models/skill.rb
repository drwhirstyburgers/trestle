# == Schema Information
#
# Table name: skills
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  preview_id :bigint           not null
#
# Indexes
#
#  index_skills_on_preview_id  (preview_id)
#
# Foreign Keys
#
#  fk_rails_...  (preview_id => previews.id)
#

class Skill < ApplicationRecord
  belongs_to :preview, dependent: :destroy
end
