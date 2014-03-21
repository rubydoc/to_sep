# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'to_sep/version'

Gem::Specification.new do |spec|
  spec.name          = "to_sep"
  spec.version       = ToSep::VERSION
  spec.authors       = ["Kim,SeongJun"]
  spec.email         = ["me@kimseongjun.co.kr"]
  spec.summary       = %q{Ruby charactor separator.}
  spec.description   = %q{When you make search in website or document, Korean charactor should be separated. to_sep help you separate a Korean charactor.}
  spec.homepage      = "https://github.com/victorkim/to_sep"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency('rspec', '~> 2.4')  
end
