# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'microbenchmarks/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-microbenchmarks"
  spec.version       = Microbenchmarks::VERSION
  spec.authors       = ["Tilo Dietrich"]
  spec.email         = ["tandrokor@gmail.com"]
  spec.description   = %q{Microbenchmarks for Ruby}
  spec.summary       = %q{Microbenchmarks for Ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency 'benchmark-ips'
  spec.add_dependency 'gli'
  spec.add_dependency 'activesupport',       '~> 4'
end
