# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'weekly_calendar/version'

Gem::Specification.new do |spec|
  spec.name          = "weekly_calendar"
  spec.version       = WeeklyCalendar::VERSION
  spec.authors       = ["Lester Zhao"]
  spec.email         = ["zm.backer@gmail.com"]
  spec.summary       = %q{make a simple weekly calendar with some events.}
  spec.description   = %q{Generate a weekly calendar easily.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
