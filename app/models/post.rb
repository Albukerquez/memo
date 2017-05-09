class Post < ApplicationRecord
  include ImageUploader::Attachment.new(:image)

  validates :description, presence: true
end
