# encoding: utf-8

class RulingEntityBannerUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  version :thumb do
    process resize_to_fit: [400, 180]
  end

  version :blur_seed, from_version: :thumb do
    process resize_to_fill: [200, 90]
    process :blur
  end

  def blur(radius=10)
    manipulate! do |img|
      original_path = img.path
      temp_image_path = File.join(Rails.root, 'public', cache_dir, "/blurred_#{File.basename(original_path)}")
      # command = "convert #{original_path} -blur 0x#{radius} #{temp_image_path}"
      # command = "convert #{original_path} -filter Gaussian -resize 50% -define filter:sigma=#{radius} -resize 200%! #{temp_image_path}"
      command = "convert #{original_path} -gaussian-blur 0x#{radius} -resize 960x125 #{temp_image_path}"
      system(command)
      MiniMagick::Image.open(temp_image_path)
    end
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def content_type_whitelist
    /image\//
  end
end
