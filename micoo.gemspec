require_relative "lib/micoo/version"

Gem::Specification.new do |s|
  s.name = "micoo"
  s.version = Micoo::VERSION
  s.platform = Gem::Platform::RUBY
  s.summary = %(Minimal Cookies Consent Banner.)

  s.description = <<~EOS
    MICOO (Minimal Cookies) is an Rails engine to handle
    Cookies consent.
  EOS

  s.authors = ["Dittmar Krall"]
  s.email = "dittmar.krall@matiq.com"
  s.homepage = "https://github.com/matique/micoo"
  s.license = "MIT"

  # s.files = `git ls-files`.split("\n")
  s.files = Dir["lib/**/*"]
  s.files += Dir["app/**/*"]
  s.files += Dir["config/**/*"]
  s.extra_rdoc_files = Dir["README.md", "MIT-LICENSE"]

  s.require_paths = ["lib"]

  s.add_development_dependency "combustion"
  s.add_development_dependency "minitest"
#  s.add_dependency "rails", ">= 7.1.3"
  s.add_dependency "rails", "= 7.2.2"
  s.add_development_dependency "ricecream"
end
