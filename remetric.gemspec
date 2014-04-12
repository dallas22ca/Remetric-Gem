$:.push File.expand_path("../lib", __FILE__)

require "remetric/version"

Gem::Specification.new do |s|
  s.name        = "remetric"
  s.version     = Remetric::VERSION
  s.authors     = ["Dallas Read"]
  s.email       = ["dallas@remetric.com"]
  s.homepage    = "http://www.remetric.com"
  s.summary     = s.description = "Track user events in your application."
  s.license     = "LGPL-3.0"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.0.rc1"
  s.add_dependency "sass-rails", "~> 4.0.1"
  s.add_dependency "uglifier", ">= 1.3.0"
  s.add_dependency "coffee-rails", "~> 4.0.0"
  s.add_dependency "jquery-rails"
  s.add_dependency "mongoid"
  s.add_dependency "turbolinks"
  s.add_dependency "liquid"
end
