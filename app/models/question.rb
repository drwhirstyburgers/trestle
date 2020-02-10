# == Schema Information
#
# Table name: questions
#
#  id             :bigint           not null, primary key
#  correct_choice :integer
#  order_number   :integer
#  question       :string
#  video_url      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  quiz_id        :bigint           not null
#
# Indexes
#
#  index_questions_on_quiz_id  (quiz_id)
#
# Foreign Keys
#
#  fk_rails_...  (quiz_id => quizzes.id)
#

class Question < ApplicationRecord
  belongs_to :quiz, dependent: :destroy
  has_many :choices, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  
  has_many :user_questions
  has_many :users, through: :user_questions
end
