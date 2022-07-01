class Role < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :users_roles
  DEFAULT_ROLES = %i[subscriber insider author banned withdrawn admin].freeze

  belongs_to :resource,
             polymorphic: true,
             optional: true

  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            allow_nil: true
  scopify
  def self.check_default_roles
    # Check if the default roles exist. If not, create them.
    DEFAULT_ROLES.each do |role|
      Role.create(name: role) unless Role.find_by(name: role)
    end
  end
end
