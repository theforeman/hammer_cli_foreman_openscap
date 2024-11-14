$:.unshift File.expand_path("../lib", __FILE__)
require "hammer_cli_foreman_openscap/version"

Gem::Specification.new do |s|

  s.name = "hammer_cli_foreman_openscap"
  s.authors = ["The Foreman team"]
  s.version = HammerCLIForemanOpenscap.version.dup
  s.platform = Gem::Platform::RUBY
  s.summary = %q{Foreman OpenSCAP commands for Hammer}
  s.license = "GPL-3.0-only"
  s.files = Dir['{lib,config,locale}/**/*', 'LICENSE', 'README.md']
  s.require_paths = ["lib"]
  s.test_files = Dir["test/**/*"]
  s.homepage = 'https://github.com/theforeman/hammer_cli_foreman_openscap'

  s.add_dependency 'hammer_cli_foreman', '>= 0.19', '< 4.0'

  s.required_ruby_version = '>= 2.7', '< 4'
end
