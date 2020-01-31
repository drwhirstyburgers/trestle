class UserQuiz < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :quiz
end
