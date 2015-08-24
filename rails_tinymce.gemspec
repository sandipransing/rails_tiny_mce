# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_tinymce/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_tinymce"
  spec.version       = RailsTinymce::VERSION
  spec.authors       = ["Sandip Ransing"]
  spec.email         = ["sandip.ransing@synerzip.com"]

  s.summary     		 = %q{A Tiny MCE Rich text Editor for rails apps using jquery, paperclip with image and media upload support}
  s.description 		 = %q{Supports Images and media upload, Easy to integrate with blogs, CMS, messages & mailers, newsletters}
  spec.homepage      = "https://github.com/sandipransing/rails_tiny_mce"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'paperclip'
  spec.add_dependency 'jrails'
  spec.add_dependency 'will_paginate'
  
	spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
