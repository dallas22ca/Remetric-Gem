# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'remetric/version'

Gem::Specification.new do |spec|
  spec.name          = "remetric"
  spec.version       = Remetric::VERSION
  spec.authors       = ["Dallas Read"]
  spec.email         = ["dallas@excitereative.ca"]
  spec.description   = %q{Remetric tracks your user data in a snap!}
  spec.summary       = %q{Remetric tracks your user data in a snap!}
  spec.homepage      = "http://www.remetric.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
