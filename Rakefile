namespace :shredis do
  desc "Start Shredis"
  task :start do
    system "bundle exec rackup"
  end
end

require "spec/rake/spectask"
Spec::Rake::SpecTask.new :spec do |spec|
  spec.spec_files = FileList["spec/**/*_spec.rb"]
end

require "cucumber/rake/task"
Cucumber::Rake::Task.new :features

desc "Run tests"
task :test do
  Rake::Task[:spec].invoke
  Rake::Task[:features].invoke
end

task :default => [:test]