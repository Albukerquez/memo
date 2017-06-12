require 'image_processing/mini_magick'

class ImageUploader < Shrine
  plugin :processing
  plugin :validation_helpers
  plugin :remove_invalid
  plugin :delete_promoted
  plugin :activerecord
  plugin :determine_mime_type
  plugin :logging, logger: Rails.logger
  plugin :remove_attachment
  plugin :store_dimensions
  plugin :versions, names: %i(original thumb)

  Attacher.validate do
    validate_max_size 2.megabytes, message: 'is too large (max is 2 MB)'
    validate_extension_inclusion [/jpe?g/, 'png', 'gif']
    validate_mime_type_inclusion ['image/jpeg', 'image/png', 'image/gif', 'image/jpg']
  end

  include ImageProcessing::MiniMagick

  def process(io, context)
    case context[:phase]
    when :store
      thumb = resize_to_limit!(io.download, 200, 200)
      { original: io, thumb: thumb }
    end
  end
  # process(:store) do |io|
  #   resize_to_limit!(io.download, 400, 400)
  # end
end
