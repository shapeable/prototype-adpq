require 'sidekiq'
if Rails.env.development?
  if ENV["REDISCLOUD_URL"]
    $redis = Redis.new(:url => ENV["REDISCLOUD_URL"])
  end
else
  Sidekiq.configure_server do |config|
    config.redis = { url: ENV.fetch("REDIS_URL") { "redis://redis:6379" } }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: ENV.fetch("REDIS_URL") { "redis://redis:6379" } }
  end

end

