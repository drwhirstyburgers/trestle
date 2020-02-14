# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  accreditation :string
#  active        :boolean          default(FALSE)
#  archive       :boolean
#  description   :string
#  duration      :integer
#  price         :float
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Course < ApplicationRecord

    has_one :preview
    has_many :sections, dependent: :destroy
    has_many :user_courses
    has_many :users, through: :user_courses

    private
    
    #This method creates an infinite loop that will crash the server
    #def check_archive_status
    #    if self.archive == true
    #        self.active = false
    #        self.save!
    #    end
    #end
end
