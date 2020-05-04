class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :courses, foreign_key: "trainer_id"
  has_many :slots, foreign_key: "trainer_id"
  has_many :companies, foreign_key: "trainer_id"
  has_many :participations
  has_many :booked_courses, through: :participations, source: :courses
  has_many :active_relationships,  class_name: "Relationship", foreign_key: "trainer_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "student_id", dependent: :destroy
  has_many :students, through: :active_relationships
  has_many :trainers, through: :passive_relationships
end
