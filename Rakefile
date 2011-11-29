require 'rake/clean'
require 'rubygems'
require 'rake/packagetask'
require 'rspec/core/rake_task'

spec = eval(File.read('migrazor.gemspec'))

Rake::PackageTask.new(spec, Migrazor::VERSION) do |pkg|
end

desc "Run the code examples in spec"
task :spec do
  RSpec::Core::RakeTask.new do |t|
    t.pattern = "./spec/**/*_spec.rb"
  end
end

task :default => :spec