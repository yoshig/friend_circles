class Link < ActiveRecord::Base
  validates :url, presence: true
  validates :post, presence: true
  belongs_to :post, inverse_of: :links
end
