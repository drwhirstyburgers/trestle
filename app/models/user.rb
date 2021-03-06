# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default("guest")
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :user_courses, dependent: :destroy
  has_many :courses, through: :user_courses

  has_many :user_sections, dependent: :destroy
  has_many :sections, through: :user_sections

  has_many :user_checkpoints, dependent: :destroy
  has_many :checkpoints, through: :user_checkpoints

  has_many :user_quizzes, dependent: :destroy
  has_many :quizzes, through: :user_quizzes

  has_many :user_questions, dependent: :destroy
  has_many :questions, through: :user_questions

  enum role: [:guest, :student, :admin]

  def deactivate_all_user_courses
    if user_courses.count > 0
      user_courses.each do |uc|
        uc.active_course = false
        uc.save!
      end
    end
  end

  def make_admin
    self.deactivate_all_user_courses
    self.role = 'admin'
    self.save!
  end

end
