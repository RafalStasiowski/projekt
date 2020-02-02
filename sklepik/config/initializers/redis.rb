uri = URI.parse(ENV["REDISTOGO_URL"])
REDIS = Redis.new(url: uri)
Rails.application.config.autoload_paths += Dir[File.join(Rails.root, "lib", "foo.rb")].each {|l| require l }
