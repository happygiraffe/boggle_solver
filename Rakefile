require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "src"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
  t.warning = true
end

task :default => [:test]
