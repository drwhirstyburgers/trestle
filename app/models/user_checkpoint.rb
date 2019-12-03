class UserCheckpoint < ApplicationRecord
  belongs_to :user
  belongs_to :checkpoint
end
