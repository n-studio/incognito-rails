require_relative "lib/incognito/version"

Gem::Specification.new do |spec|
  spec.name        = "incognito-rails"
  spec.version     = Incognito::VERSION
  spec.authors     = ["Matthew Nguyen"]
  spec.email       = ["contact@n-studio.fr"]
  spec.homepage    = "https://github.com/n-studio/incognito-rails"
  spec.summary     = "Obfuscate your paths in Rails"
  spec.description = "Change your route paths into /incognito/:uuid"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/n-studio/incognito-rails"
  spec.metadata["changelog_uri"] = "https://github.com/n-studio/incognito-rails/blob/master/CHANGELOG.md"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.3", ">= 6.1.3.1"

  spec.add_development_dependency "puma"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "capybara"
  spec.add_development_dependency "selenium-webdriver"
  spec.add_development_dependency "webdrivers"
end
