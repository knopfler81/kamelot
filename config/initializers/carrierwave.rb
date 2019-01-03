# if Rails.env.test?
#   CarrierWave.configure do |config|
#     config.storage = :file
#     config.enable_processing = false
#   end

#   # make sure our uploader is auto-loaded
# AttachmentUploader

#   # use different dirs when testing
#   CarrierWave::Uploader::Base.descendants.each do |klass|
#     next if klass.anonymous?
#     klass.class_eval do
#       def cache_dir
#         "spec/uploads/tmp"
#       end

#       def store_dir
#         "public/spec/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
#       end
#     end
#   end
# end

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :region                => 'eu-west-1',
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']

    }
    config.fog_directory     =  ENV['S3_BUCKET_NAME']
  end
end


