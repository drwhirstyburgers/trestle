# == Schema Information
#
# Table name: quizzes
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
#  index_quizzes_on_section_id  (section_id)
#
# Foreign Keys
#
#  fk_rails_...  (section_id => sections.id)
#

class Quiz < ApplicationRecord
  belongs_to :section, dependent: :destroy
  has_many :questions, dependent: :destroy

  has_many :user_quizzes
  has_many :users, through: :user_quizzes

  private
  
  def set_order_number
    if self.order_number == '' || self.order_number.nil?
      self.order_number = 100
    end
  end
end
