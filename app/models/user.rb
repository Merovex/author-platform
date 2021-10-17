class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :confirmable, :lockable, :validatable

  # has_many :roles
  has_many :posts
  has_many :visits, class_name: "Ahoy::Visit"
  include Sluggable

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:subscriber) if self.roles.blank?
  end
end
