# == Schema Information
#
# Table name: user_questions
#
#  id             :bigint           not null, primary key
#  choice         :integer
#  correct_choice :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  question_id    :bigint           not null
#  quiz_id        :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_user_questions_on_question_id  (question_id)
#  index_user_questions_on_quiz_id      (quiz_id)
#  index_user_questions_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#  fk_rails_...  (quiz_id => quizzes.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class UserQuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
