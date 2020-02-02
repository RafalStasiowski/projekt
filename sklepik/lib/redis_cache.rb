class RedisCache
  def self.new
    Redis.new(Rails.application.config_for(:redis))
  end
end