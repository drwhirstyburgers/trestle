# == Schema Information
#
# Table name: choices
#
#  id          :bigint           not null, primary key
#  choice      :string
#  number      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint           not null
#
# Indexes
#
#  index_choices_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#

class Choice < ApplicationRecord
  belongs_to :question, dependent: :destroy
end
