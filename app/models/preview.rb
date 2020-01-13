class Preview < ApplicationRecord
  belongs_to :course
  has_many :skills, dependent: :destroy
  has_rich_text :pitch
  has_one_attached :image
end