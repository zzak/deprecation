# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "deprecation"
  spec.version       = "0.0.1"
  spec.authors       = "Zachary Scott"
  spec.email         = ["zzak@ruby-lang.org"]
  spec.summary       = %q{Deprecation provides an API for deprecating methods, variables and constants.}
  spec.description   = %q{Use this gem for deprecating your code.}
  spec.homepage      = "http://www.ruby-lang.org/"
  spec.license       = "ruby"

  spec.files         = `git ls-files -z`.split("\x0")
  #spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.3"
end
