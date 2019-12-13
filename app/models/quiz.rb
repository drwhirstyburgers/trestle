class Quiz < ApplicationRecord
  belongs_to :section
  has_many :questions, dependent: :destroy

  has_many :user_quizzes
  has_many :users, through: :user_quizzes
end
