# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'localmotive/version'

Gem::Specification.new do |gem|
  gem.name          = "localmotive"
  gem.version       = Localmotive::VERSION
  gem.authors       = ["Charles Lowell"]
  gem.email         = ["cowboyd@thefrontside.net"]
  gem.description   = %q{a rails engine for local development}
  gem.summary       = %q{keep a private set of per-environment configurations for just your machine}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'railties', '>= 3'
end
