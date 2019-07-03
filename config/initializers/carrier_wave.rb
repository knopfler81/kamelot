if Rails.env.production?
  CarrierWave.configure do |config|
    config.cache_dir = "#{Rails.root}/tmp/"
    config.permissions = 0666
    config.fog_credentials = {
      # Configuration for Amazon S3
      :region                => 'eu-west-3',
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']

    }
    config.storage = :fog
    config.fog_directory     =  ENV['S3_BUCKET_NAME']
  end
end