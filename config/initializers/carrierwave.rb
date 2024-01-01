CarrierWave.configure do |config|
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
    aws_secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
    region: 'ap-northeast-1'
  }

  # config.fog_directory = 'mini-app-week' if Rails.env.production?
  # config.fog_directory = 'mini-app-week' if Rails.env.development?
  config.fog_directory = 'mini-app-week'
  config.fog_public = false
  config.fog_authenticated_url_expiration = 60
end
