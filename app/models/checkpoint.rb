class Checkpoint < ApplicationRecord
  belongs_to :section
  has_rich_text :content
end
