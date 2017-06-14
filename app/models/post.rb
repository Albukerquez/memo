# frozen_string_literal: true

class Post < ApplicationRecord
  attr_accessor :content

  belongs_to :user
  has_many :comments, dependent: :destroy
  include ImageUploader::Attachment.new(:image)

  validates :image, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
end
