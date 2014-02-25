class PostShare < ActiveRecord::Base
  belongs_to :post
  belongs_to :friend_circle
end
