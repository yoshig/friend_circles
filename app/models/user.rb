class User < ActiveRecord::Base
  attr_reader :password

  before_validation :ensure_token
  validates :email, :token, :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :friend_circles, inverse_of: :user

  has_many :circle_memberships, inverse_of: :user
  has_many :friend_circle_memberships, through: :circle_memberships, source: :friend_circle
  has_many :post_shares, through: :friend_circle_memberships, source: :post_shares
  has_many :shared_posts, through: :post_shares, source: :post

  has_many :friends, through: :friend_circles, source: :users
  has_many :posts

  def password=(secret)
    @password = secret
    self.password_digest = BCrypt::Password.create(secret)
  end

  def is_password?(secret)
    BCrypt::Password.new(self.password_digest).is_password?(secret)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    user if user && user.is_password?(password)
  end

  def reset_token!
    self.token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.token
  end

  def ensure_token
    self.token ||= reset_token!
  end


end
