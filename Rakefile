load_paths = FileList['spec', 'lib']
ruby_args = load_paths.pathmap('-I%p')

desc 'Run both test and style checker'
task all: [:test, :style]

desc 'Test (default behaviour)'
task default: :test

desc 'Minitest gem used for testing'
task :test do
  require 'minitest'
  command = "ruby #{ruby_args} -rminitest/autorun spec/core_spec.rb"
  sh command
end

desc 'Rubocop for style hints'
task :style do
  sh 'rubocop'
end
