class Post < ActiveRecord::Base
  validates :body, presence: true

  belongs_to :user
  has_many :post_shares
  has_many :friend_circles, through: :post_shares
  has_many :links, inverse_of: :post
end
