class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true
  validates :content, length: { in: 2..20 }
  validates :user_id, presence: true
end
