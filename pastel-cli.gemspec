# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "pastel-cli"
  spec.version       = "0.4.0"
  spec.authors       = ["Piotr Murach"]
  spec.email         = ["piotr@piotrmurach.com"]
  spec.summary       = %q{CLI tool for intuitive terminal output styling}
  spec.description   = %q{CLI tool for intuitive terminal output styling}
  spec.homepage      = "https://ttytoolkit.org"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["bug_tracker_uri"] = "https://github.com/piotrmurach/pastel-cli/issues"
  spec.metadata["changelog_uri"] = "https://github.com/piotrmurach/pastel-cli/blob/master/CHANGELOG.md"
  spec.metadata["documentation_uri"] = "https://www.rubydoc.info/gems/pastel-cli"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/piotrmurach/pastel-cli"

  spec.files = ["man/pastel.1"]
  spec.extra_rdoc_files = Dir["README.md", "CHANGELOG.md", "LICENSE.txt"]
  spec.bindir        = "exe"
  spec.executables   = %w[pastel]
  spec.required_ruby_version = Gem::Requirement.new(">= 2.0.0")

  spec.add_dependency "pastel", "~> 0.8"

  spec.add_development_dependency "kramdown", ">= 1.17"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.0"
end
