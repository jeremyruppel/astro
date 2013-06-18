# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'astro/version'

Gem::Specification.new do |spec|
  spec.name          = 'astro'
  spec.version       = Astro::VERSION
  spec.authors       = ['Jeremy Ruppel']
  spec.email         = ['jeremy.ruppel@gmail.com']
  spec.description   = %q{Your DIY asset distribution web service.}
  spec.summary       = %q{Your DIY asset distribution web service.}
  spec.homepage      = 'https://github.com/jeremyruppel/astro'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'sinatra',         '~> 1.4.3'
  spec.add_dependency 'sinatra-contrib', '~> 1.4.0'
  spec.add_dependency 'sprockets',       '~> 2.10.0'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'bundler',       '~> 1.3'
  spec.add_development_dependency 'rspec',         '~> 2.13.0'
  spec.add_development_dependency 'rack-test',     '~> 0.6.2'
  spec.add_development_dependency 'git-approvals', '~> 0.4.0'
  spec.add_development_dependency 'uglifier',      '~> 2.1.1'
  spec.add_development_dependency 'awesome_print', '~> 1.1.0'
  spec.add_development_dependency 'sass',          '~> 3.2.9'
  spec.add_development_dependency 'guard-rspec',   '~> 3.0.1'
  spec.add_development_dependency 'pry',           '~> 0.9.12.2'
end
