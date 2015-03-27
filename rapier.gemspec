# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rapier/version'

Gem::Specification.new do |spec|
  spec.name          = 'rapier'
  spec.version       = Rapier::VERSION
  spec.authors       = ['Eumir Gaspar']
  spec.email         = ['eumir@aelogica.com']

  spec.summary       = %q{A gem to create a Ruby gem wrapper for your API}
  spec.homepage      = 'http://github.com/corroded/rapier'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
end
