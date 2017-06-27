# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many :notifications, dependent: :destroy

  include ImageUploader::Attachment.new(:image)

  validates :user_id, :description, :image, presence: true
  validates :description, length: { in: 2..80 }
end
