# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  role                   :integer          default("guest")
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
end
