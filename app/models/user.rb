class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  attr_accessor :login

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: {case_sensitive: false}, format: {with: /\A[a-zA-Z0-9]+\z/, message: "can only contain alphanumeric characters"}

  # Associations
  has_many :team_users, dependent: :destroy
  has_many :teams, through: :team_users
  has_many :owned_teams, class_name: "Team", foreign_key: "owner_id", dependent: :destroy
  has_many :creator_roles, class_name: "Role", foreign_key: "creator_id", dependent: :destroy
  has_many :roles, through: :team_users

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(email) = :value OR lower(username) = :value", {value: login.downcase}]).first
    else
      where(conditions.to_hash).first
    end
  end

  def available_teams
    team_users_teams = team_users.map(&:team)
    (owned_teams + team_users_teams).uniq
  end

  def fullname
    "#{first_name} #{last_name}"
  end
end
