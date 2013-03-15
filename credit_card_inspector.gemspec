# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'credit_card_inspector/version'

Gem::Specification.new do |spec|
  spec.name          = "credit_card_inspector"
  spec.version       = CreditCardInspector::VERSION
  spec.authors       = ["Steve Lorek"]
  spec.email         = ["steve@stevelorek.com"]
  spec.description   = %q{Validates credit cards according to the Luhn algorithm. Also determines the type of card from its number}
  spec.summary       = %q{Validate card numbers and determine card type}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
