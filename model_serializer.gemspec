# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'model_serializer/version'

Gem::Specification.new do |spec|
  spec.name          = "model_serializer"
  spec.version       = ModelSerializer::VERSION
  spec.authors       = ["Yehia Abo El-Nga"]
  spec.email         = ["yehia@ewsalo.com"]
  spec.description   = %q{A model serializer}
  spec.summary       = %q{A model serializer}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
