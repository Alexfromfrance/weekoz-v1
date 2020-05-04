class Relationship < ApplicationRecord
  belongs_to :trainer, class_name: "User"
  belongs_to :student, class_name: "User"
end
