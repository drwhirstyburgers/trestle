# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  title         :string
#  description   :string
#  price         :float
#  duration      :integer
#  accreditation :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  active        :boolean          default(FALSE)
#

class Course < ApplicationRecord
    has_many :sections, dependent: :destroy
end
