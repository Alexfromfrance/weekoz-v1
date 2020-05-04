class Slot < ApplicationRecord
  belongs_to :trainer, class_name: "User"
end
