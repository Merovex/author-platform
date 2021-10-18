# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.has_role? :admin
        can :manage, :all
      elsif user.has_role? :insider
        # Can contribute to Community
        # * Forum
        # * Comments
        # Can receive status emails
        can :read, :all
      elsif user.has_role? :banned
        # User was kicked out for being an asshole
      elsif user.has_role? :outcast
        # User has left the community
      else
        can :read, :all
      end
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
_s