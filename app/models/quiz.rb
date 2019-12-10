class Quiz < ApplicationRecord
  belongs_to :section
  has_many :questions, dependent: :destroy
end
