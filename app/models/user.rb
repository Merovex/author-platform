class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  acts_as_target # Allows user to receive notifications.

  devise :database_authenticatable, :trackable,
         :magic_link_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :lockable, :validatable

  has_one_attached :avatar
  has_many :posts
  has_many :comments
  has_many :todolists
  has_many :assigntments, class_name: :todos

  has_many :visits, class_name: 'Ahoy::Visit'
  has_many :events, class_name: 'Ahoy::Event'

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  before_create :set_slug
  attribute :slug, :string
  # def set_slug
  #   loop do
  #     self.slug = SecureRandom.base64(4).tr('+/=', '')
  #     break unless User.where(slug:).exists?
  #   end
  # end

  include Subscriber
  include Slug
  def to_param
    slug
  end

  rolify
  after_create :assign_default_role

  before_save :ensure_authentication_token
  def ensure_authentication_token
    self.authentication_token = generate_authentication_token if authentication_token.blank?
  end

  def subscribers
    where('published_at < ?', Time.now.utc)
  end

  def to_s
    name.nil? ? email : name
  end

  def has_avatar?
    false
  end
  protected

  def password_required?
    confirmed? ? super : false
  end

  def assign_default_role
    add_role(:subscriber) if roles.blank?
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
