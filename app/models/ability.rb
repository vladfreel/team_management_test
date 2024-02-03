# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, Team, owner_id: user.id
    can :manage, Role, creator_id: user.id
  end
end
