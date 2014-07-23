# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'time_humanizer/version'

Gem::Specification.new do |spec|
  spec.name          = "time_humanizer"
  spec.version       = TimeHumanizer::VERSION
  spec.authors       = ["Bartłomiej Wójtowicz"]
  spec.email         = ["bart@softkiwi.com"]
  spec.summary       = %q{Formats seconds to readable time format i.e. 8h05m and vice versa}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/b-wojtowicz/time_humanizer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
