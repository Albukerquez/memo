class Comment < ApplicationRecord
  # attr_accessor :content, :user, :post

  belongs_to :user
  belongs_to :post

  validates :content, presence: true
  validates :content, length: { in: 2..20 }
end
