# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/cosigner/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-cosigner'
  spec.version       = Fastlane::Cosigner::VERSION
  spec.author        = %q{André Pacheco Neves, Luís Portela Afonso}
  spec.email         = %q{ios@mindera.com}

  spec.summary       = %q{A fastlane plugin to help you sign your iOS builds}
  spec.homepage      = "https://github.com/Mindera/fastlane-plugin-cosigner"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'xcodeproj', '~> 1.4.2'
  spec.add_dependency 'colorize', '~> 0.7.7'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 2.13.0'
end
