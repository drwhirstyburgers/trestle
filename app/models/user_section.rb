class UserSection < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :section
end
