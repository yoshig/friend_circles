class CircleMembership < ActiveRecord::Base
  belongs_to :user, inverse_of: :circle_memberships
  belongs_to :friend_circle, inverse_of: :circle_memberships
end
