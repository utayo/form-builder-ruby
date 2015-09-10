task :default => [:spec] 

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.pattern = 'spec/**/spec_*.rb'
    spec.rspec_opts = ["-I #{File.expand_path("./lib", File.dirname(__FILE__))}"]
  end
rescue LoadError => e
end

