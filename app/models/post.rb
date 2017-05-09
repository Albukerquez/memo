# frozen_string_literal: true

class Post < ApplicationRecord
  include ImageUploader::Attachment.new(:image)

  validates :image, presence: true
  validates :description, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
end
