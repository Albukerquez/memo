class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, :user_id, presence: true
  validates :content, length: { in: 2..20 }
end
