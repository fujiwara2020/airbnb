class RoomImageUploader < CarrierWave::Uploader::Base
  
  include CarrierWave::MiniMagick

  storage :file
 
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [50, 50]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  process resize_to_limit: [300, 200]

end
