require 'rake/testtask'

Bundler::GemHelper.install_tasks

Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.test_files = Dir.glob('test/**/*_test.rb')
  t.verbose = true
  t.warning = ENV.key?('RUBY_WARNINGS')
end

require "hammer_cli_foreman_openscap/version"
require "hammer_cli_foreman_openscap/i18n"
require "hammer_cli/i18n/find_task"
HammerCLI::I18n::FindTask.define(HammerCLIForemanOpenscap::I18n::LocaleDomain.new, HammerCLIForemanOpenscap.version.to_s)
