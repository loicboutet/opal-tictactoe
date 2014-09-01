require 'bundler'
Bundler.require

require 'opal/rspec/rake_task'
Opal::RSpec::RakeTask.new(:default) do |s|
  s.append_path 'app'
  s.append_path 'vendor'
end

# Rakefile
require 'opal'

desc "Build our app to build.js"
task :build do
  Opal::Processor.source_map_enabled = false
  env = Opal::Environment.new
  env.append_path "app"
  env.append_path "vendor"

  File.open("build.js", "w+") do |out|
    out << env["application"].to_s
  end
end
