class UserQuestion < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :question
end
