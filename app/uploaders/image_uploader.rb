class ImageUploader < Shrine
  include ImageProcessing::MiniMagick

  plugin :processing
  plugin :validation_helpers
  plugin :remove_invalid
  plugin :delete_promoted
  plugin :activerecord
  plugin :determine_mime_type
  plugin :logging, logger: Rails.logger
  plugin :remove_attachment
  plugin :store_dimensions
  plugin :versions, names: %i(original large medium small thumb)

  Attacher.validate do
    validate_max_size 2.megabytes, message: 'is too large (max is 2 MB)'
    validate_extension_inclusion [/jpe?g/, 'png', 'gif']
    validate_mime_type_inclusion ['image/jpeg', 'image/png', 'image/gif', 'image/jpg']
  end

  def process(io, context)
    if context[:phase] == :store
      size700 = resize_to_limit!(io.download, 700, 700)
      size500 = resize_to_limit(size700,      500, 500)
      size300 = resize_to_limit(size500,      300, 300)
      thumb   = resize_to_limit(size300,      200, 200)

      { original: io, large: size700, medium: size500, small: size300, thumb: thumb }
    end
  end
end
