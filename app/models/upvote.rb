class Upvote < ActiveRecord::Base
  validates :user_id, :post_id, presence: true
end
