class Role < ApplicationRecord
  belongs_to :creator, class_name: "User"

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  # Other methods or callbacks can be added here as needed
end
