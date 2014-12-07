class FeaturedImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::Compatibility::Paperclip
  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fill => [50, 50]
  end

  def extension_white_list
    %w(jpg jpeg jpe gif png)
  end

end
