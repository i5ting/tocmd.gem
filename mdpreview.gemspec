# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mdpreview/version'

Gem::Specification.new do |gem|
  gem.name          = "mdpreview"
  gem.version       = Mdpreview::VERSION
  gem.authors       = ["shiren1118"]
  gem.email         = ["shiren1118@126.com"]
  gem.description   = %q{dsdfn}
  gem.summary       = %q{dsfsdf}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
