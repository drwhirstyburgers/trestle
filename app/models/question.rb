class Question < ApplicationRecord
  belongs_to :quiz, dependent: :destroy
  has_many :choices, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  
  has_many :user_questions
  has_many :users, through: :user_questions
end
