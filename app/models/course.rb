class Course < ApplicationRecord
  belongs_to :trainer, class_name: "User"
  has_many :participations
  has_many :students, through: :participations
end
