class TeamUser < ApplicationRecord
  # Associations
  belongs_to :team
  belongs_to :user
  belongs_to :role

  # Other methods or callbacks can be added here as needed
end
