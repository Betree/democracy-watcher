CarrierWave.configure do |config|
  if ENV.has_key? 'USE_S3_STORAGE' and ENV['USE_S3_STORAGE'] == 'enabled'
    config.root = Rails.root.join('tmp')
    config.cache_dir = 'carrierwave'

    config.fog_credentials = {
        provider:              'AWS',
        aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
        aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        region: ENV['S3_REGION']
    }

    config.fog_directory  = ENV['S3_BUCKET_NAME']
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
    config.storage = :fog
  else
    config.storage = :file
  end
end