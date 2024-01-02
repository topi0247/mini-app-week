CarrierWave.configure do |config|
  if Rails.env.development?
    config.storage = :file
    config.enable_procession = false if Rails.env.test?
  elsif Rails.env.production?
    config.cache_dir = "#{Rails.root}/tmp/uploads"
    config.storage = :fog
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
      aws_secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
      region: 'ap-northeast-1'
    }
    config.fog_directory = 'mini-app-week' if Rails.env.production?
    config.fog_public = false
    config.fog_authenticated_url_expiration = 60
  end
end
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
