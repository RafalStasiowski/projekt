module DinnerDash
  class Application < Rails::Application
    config.autoload_paths += Dir[File.join(Rails.root, "lib", "redis_cache.rb")].each {|l| require l }
  end
end