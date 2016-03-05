# encoding: utf-8

Gem::Specification.new do |spec|
  spec.name          = 'pastel-cli'
  spec.version       = '0.2.0'
  spec.authors       = ['Piotr Murach']
  spec.email         = ['']
  spec.summary       = %q{CLI tool for intuitive terminal output styling}
  spec.description   = %q{CLI tool for intuitive terminal output styling}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})

  spec.add_dependency 'pastel', '~> 0.6.0'

  spec.add_development_dependency 'bundler', '>= 1.5.0', '< 2.0'
  spec.add_development_dependency 'rake'
end
