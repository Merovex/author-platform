

module Communicable
  extend ActiveSupport::Concern
  included do 
    has_many :memberships, dependent: :destroy, as: :membershipable
    has_many :members, through: :memberships, source: :user
    after_create :create_membership
    
    def create_membership
      memberships.create
    end
  end
end