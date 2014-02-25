class FriendCircle < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user, inverse_of: :friend_circles
  has_many :circle_memberships, inverse_of: :friend_circle
  has_many :users, through: :circle_memberships, source: :user
  has_many :post_shares
  has_many :posts, through: :post_shares
end
