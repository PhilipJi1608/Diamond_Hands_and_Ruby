# frozen_string_literal: true

lib = File.expand_path 'lib', __dir__

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'diamond_hands_and_ruby/version'

Gem::Specification.new do |spec|
  spec.name = 'diamond_hands_and_ruby'
  spec.version = DiamondHandsAndRuby::VERSION
  spec.authors = ['Philip Ji', 'Ben Jessop', 'Daisth Abeysingura']
  spec.summary = 'In the memory of dasit mane'
  spec.files = 'git ls-files'.split($RS)
  spec.test_files = spec.files.grep(%r{^(test|spec)/})
  spec.require_paths = %w[lib]
  spec.required_ruby_version = '>= 2.7.1'
  spec.license = 'MIT'

  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
end
