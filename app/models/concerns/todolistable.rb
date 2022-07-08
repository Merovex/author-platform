

module Todolistable
  extend ActiveSupport::Concern
  included do 
    has_many :todolists, dependent: :destroy, as: :todolistable
    # has_many :members, through: :todolists, source: :user
    # after_create :create_todolist
    
    # def create_todolist
    #   memberships.create
    # end
  end
end