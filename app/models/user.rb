class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :confirmable, :lockable, :validatable

  has_many :posts
  has_many :visits, class_name: "Ahoy::Visit"

  include Sluggable

  rolify
  after_create :assign_default_role

  protected
    def password_required?
      confirmed? ? super : false
    end
    def assign_default_role
      self.add_role(:subscriber) if self.roles.blank?
    end
end
