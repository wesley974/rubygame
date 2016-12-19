load_paths = FileList['spec', 'lib']
ruby_args = load_paths.pathmap('-I%p')

task all: [:test, :style]

desc 'test'
task default: :test

desc 'Run both test and style checker'
task accept: [:test, :style]

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
