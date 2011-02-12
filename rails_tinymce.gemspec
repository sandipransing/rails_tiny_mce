# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rails_tinymce/version"

Gem::Specification.new do |s|
  s.name        = "rails_tinymce"
  s.version     = RailsTinymce::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Core contributors, Sandip Ransing, Ilake Flake, Anstorm"]
  s.email       = ["san2821@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A Tiny MCE Rich text Editor for rails 3 apps using jquery, paperclip with image and media upload support}
  s.description = %q{Supports Images and media upload, Easy to integrate with blogs, CMS, messages & mailers, newsletters}

  s.rubyforge_project = "rails_tinymce"
  s.add_dependency 'paperclip'
  s.add_dependency 'jrails'
  s.add_dependency 'will_paginate'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
