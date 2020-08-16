lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'weighted-select/version'

Gem::Specification.new do |spec|
  spec.name          = 'weighted-select'
  spec.version       = WeightedSelect::VERSION
  spec.authors       = ['Maxim Khan-Magomedov']
  spec.email         = ['maxim.km@gmail.com']

  spec.summary       = %q{Gem for selecting items by weight}
  spec.homepage      = 'https://github.com/ozgg/weighted-select'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec"
end
