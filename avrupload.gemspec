# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'avrupload/version'

Gem::Specification.new do |spec|
  spec.name          = "avrupload"
  spec.version       = AvrUpload::VERSION
  spec.authors       = ["Michel Megens"]
  spec.email         = ["dev@bietje.net"]
  spec.license       = "GPLv3"

  spec.summary       = %q{AVRdude for PC with difficult behaviour}
  spec.description   = "avrupload enforces certain TTY settings before uploading hex files using avrdude"
  spec.homepage      = "http://etaos.bietje.net"

  spec.files         = [
    'bin/avrupload',
    'lib/avrupload.rb',
    'lib/avrupload/avrdudeproxy.rb',
    'lib/avrupload/version.rb'
  ]

  spec.bindir        = 'bin'
  spec.executables   = 'avrupload'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
