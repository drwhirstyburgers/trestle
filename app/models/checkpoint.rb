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

class Checkpoint < ApplicationRecord
  include ActionText::Attachable
  belongs_to :section
  has_rich_text :content

  has_many :user_checkpoints
  has_many :users, through: :user_checkpoints
end
