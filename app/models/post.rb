# frozen_string_literal: true

class Post < ApplicationRecord
  attr_accessor :content

  belongs_to :user
  has_many :comments, dependent: :destroy
  include ImageUploader::Attachment.new(:image)

  validates :user_id, :description, :image, presence: true
  validates :description, length: { in: 2..40 }

  extend FriendlyId
  friendly_id :description, use: :slugged

  def should_generate_new_friendly_id?
    description_changed?
  end
end
