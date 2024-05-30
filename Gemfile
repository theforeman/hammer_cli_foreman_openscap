source "https://rubygems.org"

gemspec

group :test do
  gem 'rake'
  gem 'minitest', '5.18'
  gem 'minitest-spec-context'
  gem 'mocha', '~> 1.11.0'
  gem 'simplecov'
  gem 'theforeman-rubocop', '~> 0.1.0'
end

# for generating i18n files, gettext > 3.0 dropped ruby 1.8 support
gem 'gettext', '>= 3.1.3', '< 4.0.0'

# load local Gemfile
local_gemfile = File.join(File.dirname(__FILE__), 'Gemfile.local.rb')
self.instance_eval(Bundler.read_file(local_gemfile)) if File.exist?(local_gemfile)
