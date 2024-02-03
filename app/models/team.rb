class Team < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  # Associations
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :team_users, dependent: :destroy
  has_many :users, through: :team_users
  has_many :members, through: :team_users, source: :user
end
