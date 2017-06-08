require 'image_processing/mini_magick'

class ImageUploader < Shrine

  include ImageProcessing::MiniMagick

  plugin :processing

  process(:store) do |io|
    resize_to_limit!(io.download, 200, 200)
  end
end
