class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  devise :database_authenticatable, :trackable, 
         :magic_link_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :lockable, :validatable

  has_many :posts
  has_many :visits, class_name: "Ahoy::Visit"
  has_many :events, class_name: "Ahoy::Event"

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  before_create :set_slug
  attribute :slug, :string
  def set_slug
    loop do
      self.slug = SecureRandom.base64(6).tr('+/=','')
      break unless User.where(slug: slug).exists?
    end
  end

  include Sluggable, Subscriber

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
