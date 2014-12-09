#require 'rubygems'
#require 'rake'
require 'rspec/core/rake_task'

desc "Run all tests"
	RSpec::Core::RakeTask.new('uitest') do |t|
  	t.rspec_opts = ["--format documentation","--color"]
  	t.pattern = ['spec/*.rb']
end 