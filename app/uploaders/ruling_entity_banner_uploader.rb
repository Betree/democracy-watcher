# encoding: utf-8

class RulingEntityBannerUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :thumb do
    process resize_to_fit: [400, 180]
  end

  version :mini, from_version: :thumb do
    process resize_to_fit: [80, 60]
  end

  version :blur_seed, from_version: :thumb do
    process resize_to_fill: [200, 90]
    process :blur
  end

  def blur(radius=10)
    manipulate! do |img|
      command = "convert #{img.path} -gaussian-blur 0x#{radius} -resize 960x125 #{img.path}"
      system(command)
      MiniMagick::Image.open(img.path)
    end
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def content_type_whitelist
    /image\//
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
