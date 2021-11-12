# frozen_string_literal: true

require_relative "lib/FDP/builder/version"

Gem::Specification.new do |spec|
  spec.name          = "FDP-builder"
  spec.version       = FDP::VERSION
  spec.authors       = ["Mark Wilkinson"]
  spec.email         = ["markw@illuminae.com"]

  spec.summary       = "helps you build fdps."
  spec.description   = "helps you build fdps."
  spec.homepage      = "https://github.com/markwilkinson/FAIR-Data-Point-Builder."
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/markwilkinson/FAIR-Data-Point-Builder"
  spec.metadata["changelog_uri"] = "https://github.com/markwilkinson/FAIR-Data-Point-Builder/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
   
  
  spec.add_dependency "rest-client", "~> 2"
  spec.add_dependency "linkeddata", "~>3"
  spec.add_dependency "json", "~> 2.5"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
