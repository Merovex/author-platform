# frozen_string_literal: true

class MembershipListComponent < ViewComponent::Base
  include UsersHelper
  def initialize(memberships:)
    @memberships = memberships
  end
end
