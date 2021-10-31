class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :trackable, 
         :passwordless_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :lockable, :validatable

  has_many :posts
  has_many :visits, class_name: "Ahoy::Visit"

  include Sluggable

  rolify
  after_create :assign_default_role

  before_save :ensure_authentication_token
  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  protected
    def password_required?
      confirmed? ? super : false
    end
    def assign_default_role
      self.add_role(:subscriber) if self.roles.blank?
    end
    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(authentication_token: token).first
      end
    end
end
