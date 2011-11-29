# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','migrazor_version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'Migrazor'
  s.version = Migrazor::VERSION
  s.author = 'Matt Simpson'
  s.email = 'matt@railsgrammer.com'
  s.homepage = 'http://railsgrammer.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Migrate from one server to the next'
# Add your other files here if you make them
  s.files = %w(
bin/migrazor
  )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','migrazor.rdoc']
  s.rdoc_options << '--title' << 'migrazor' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'migrazor'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
end
