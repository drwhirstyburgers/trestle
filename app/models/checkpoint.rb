class Checkpoint < ApplicationRecord
  belongs_to :section
  has_many :checkpoint_contents, dependent: :destroy
end
