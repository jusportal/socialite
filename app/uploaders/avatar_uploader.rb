class AvatarUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick

  process resize_to_fill: [300, 300]

  def default_url
    "/images/fallback/" + [version_name, "default_avatar.png"].compact.join('_')
  end

  version :profile do
    process resize_to_fill: [100, 100]
  end

  version :nav do
    process resize_to_fill: [30, 30]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end  
end
