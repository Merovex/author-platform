class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_create :add_unsubscribe_hash
  before_create :set_slug

  acts_as_target # Allows user to receive notifications.
  has_paper_trail

  devise :database_authenticatable, :trackable,
         :magic_link_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :lockable, :validatable

  has_one_attached :avatar
  has_many :posts
  has_many :comments
  has_many :todolists
  has_many :assignments, class_name: :todos
  has_many :activities
  has_many :memberships

  has_many :visits, class_name: 'Ahoy::Visit'
  has_many :events, class_name: 'Ahoy::Event'

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  
  attribute :slug, :string

  scope :post_subscribers, -> { where(notify_when_broadcast_post: true) }
  scope :book_subscribers, -> { where(notify_when_release_book: true) }
  scope :project_subscribers, -> { where(notify_when_release_book: true) }
  scope :checkin_subscribers, -> { where(notify_when_checkin: true) }
  scope :task_subscribers, -> { where(notify_when_task_completed: true) }

  def activities
    PublicActivity::Activity.where(owner_id: id) # .select(:trackable_id)
  end

  # include Subscriber
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

  def to_s
    name.nil? ? email : name
  end

  def has_avatar?
    false
  end

  def add_unsubscribe_hash
    self.unsubscribe_hash = SecureRandom.hex
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
