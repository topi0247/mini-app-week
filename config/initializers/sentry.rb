Sentry.init do |config|
  config.dsn = 'https://5515e89be82257644978be0a9b8d5bf1@o4506477837090816.ingest.sentry.io/4506477866123264'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end