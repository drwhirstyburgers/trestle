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

class Checkpoint < ApplicationRecord
  before_save :set_order_number
  belongs_to :section
  has_rich_text :content

  has_many :user_checkpoints
  has_many :users, through: :user_checkpoints

  private
  
  def set_order_number
    if self.order_number == '' || self.order_number.nil?
      self.order_number = 100
    end
  end
end
