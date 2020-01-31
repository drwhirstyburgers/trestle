class UserCheckpoint < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :checkpoint
end
