class CheckpointContent < ApplicationRecord
  belongs_to :checkpoint

  enum type: [:text, :video, :image]
end
