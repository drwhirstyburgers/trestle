class Skill < ApplicationRecord
  belongs_to :preview, dependent: :destroy
end
