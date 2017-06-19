# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'funbox_nmax/version'

Gem::Specification.new do |spec|
  spec.name          = "funbox_nmax"
  spec.version       = FunboxNmax::VERSION
  spec.authors       = ["Artemiy Solopov"]
  spec.email         = ["art-solopov@yandex.ru"]

  spec.summary       = %q{Extracting numbers from text and finding N largest}
  spec.description   = %q{This app extracts numbers from a text stream and
                          outputs the largest N of these numbers}
  spec.homepage      = "https://github.com/art-solopov/funbox_nmax"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
