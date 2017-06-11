class Comment < ApplicationRecord
  attr_accessor :body, :user, :post

  belongs_to :user
  belongs_to :post

  validates :name, :content, presence: true
  validates :name, length: { in: 2..20 }
end
